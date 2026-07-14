# GPU Resource Mapping Ground Truth

This document defines the ground-truth for HLSL register/space mappings and their corresponding Pharo-side binding indices to avoid transpilation errors (`shadercross`) and backend validation failures.

## Resource Layout Rules (SDL_GPU)

Based on repeated `shadercross` errors, the transpiler imposes strict rules on how descriptors are mapped. **In PharoSDL3, the HLSL Register Number must match the Pharo Slot Index.**

| Resource Type | HLSL Register | Transpiler Space | Pharo Slot | Pharo API |
| :--- | :--- | :--- | :--- | :--- |
| **Compute Uniform** | `b0` | `space2` | 0 | `pushGPUComputeUniformDataSlotIndex: 0 ...` |
| **Vertex Uniform** | `b0` | `space1` | 0 | `pushGPUVertexUniformDataSlotIndex: 0 ...` |
| **Fragment Uniform** | `b0` | `space3` | 0 | `pushGPUFragmentUniformDataSlotIndex: 0 ...` |
| **RO Storage (Vert/Comp)** | `t0` | `space0` | 0 | `vertexStorageBuffers: ... slot: 0` |
| **RO Storage (Fragment)** | `t0` | `space2` | 0 | `fragmentStorageBuffers: ... slot: 0` |
| **RW Storage** | `u0` | `space1` | 0 | `computeStorageBuffers: ... slot: 0` |
| **Samplers (Vert/Comp)** | `s0` | `space0` | 0 | `vertexSamplers: ... slot: 0` |
| **Samplers (Fragment)** | `s0` | `space2` | 0 | `fragmentSamplers: ... slot: 0` |

> [!WARNING]
> **Space Collision Risk**: Never assign both `RO Storage` (register t) and `RW Storage` (register u) to the same **space**. While D3D might allow this, the `shadercross` transpiler maps spaces to descriptor sets/argument buffers. Assigning them to the same space can cause them to overlap, leading to silent failures or zeroed-out results in the GPU.

> [!NOTE]
> **Multiple Resources**: The table above shows `0` for the HLSL Register and Pharo Slot. If you need multiple resources of the same type, simply increment the register and slot while keeping the same space. For example, a second vertex sampler would be `register(s1, space0)` in HLSL and `slot: 1` in Pharo.

> [!NOTE]
> **Memory Alignment (std140)**: When defining a `cbuffer` in HLSL, remember that GPU hardware requires strict memory alignment (std140 layout). If your `cbuffer` has a `float3` followed by a `float`, your corresponding Smalltalk FFI struct must include the necessary padding bytes to match the GPU's expectation, or the data will be read incorrectly.

---

## API Binding Reference

To bind resources correctly, follow these Pharo API mappings. **All high-level methods require an explicit slot index.**

### 1. Vertex Buffers (Graphics)
- **Pharo API**: `renderPass vertexBuffers: bindings slot: index`
- **Usage**: Use for standard vertex attribute arrays (e.g., Position, Color).
- **Cascade Example**:
  ```smalltalk
  renderPass
      bindGPUGraphicsPipeline: pipeline;
      vertexBuffers: vertexBindings slot: 0;
      drawGPUPrimitivesNumVertices: 3 numInstances: 1 firstVertex: 0 firstInstance: 0
  ```

### 2. Storage Buffers (Manual Fetching)
- **Pharo API**: `renderPass vertexStorageBuffers: buffers slot: index`
- **Pharo API**: `renderPass fragmentStorageBuffers: buffers slot: index`
- **Usage**: Use for `StructuredBuffer` access in vertex/fragment shaders. 
- *Note*: Use Slot 0 for `space0` resources in vertex shaders.

### 3. Uniforms
- **Pharo API**: `aCommandBuffer pushGPUVertexUniformDataSlotIndex: slot data: data length: len`
- **Usage**: Slot 0 is standard for the primary uniform block (`space1`).
- **HLSL Example**:
  ```hlsl
  cbuffer MyUniformBlock : register(b0, space1) {
      float4x4 projectionMatrix;
  };
  ```
  ```smalltalk
  "Matching Pharo API"
  commandBuffer pushGPUVertexUniformDataSlotIndex: 0 data: matrixData length: 64.
  ```

### 4. Compute Storage
- **Pharo API**: `computePass computeStorageBuffers: buffers slot: index`
- **Pharo API**: `computePass computeStorageTextures: textures slot: index`
- **Usage**: Map to corresponding register/space per shader layout.

### 5. Copy Passes
- **Pharo API**: `commandBuffer copyPassDo: [ :copyPass | ... ]`
- **Usage**: Use for uploading/downloading data between CPU and GPU.
- **Example**:
  ```smalltalk
  commandBuffer copyPassDo: [ :copyPass |
      copyPass uploadToGPUBufferSource: source destination: dest cycle: false ]
  ```

## Troubleshooting Flow
If a transpilation error occurs (`Descriptor set index... must be...`), consult the table above. Ensure that the **space** assigned in HLSL matches the transpiler's requirement for that resource type.
