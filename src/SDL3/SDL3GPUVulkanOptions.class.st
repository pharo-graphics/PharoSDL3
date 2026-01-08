Class {
	#name : 'SDL3GPUVulkanOptions',
	#superclass : 'SDL3Structure',
	#classVars : [
		'OFFSET_DEVICE_EXTENSION_COUNT',
		'OFFSET_DEVICE_EXTENSION_NAMES',
		'OFFSET_FEATURE_LIST',
		'OFFSET_INSTANCE_EXTENSION_COUNT',
		'OFFSET_INSTANCE_EXTENSION_NAMES',
		'OFFSET_VULKAN_10_PHYSICAL_DEVICE_FEATURES',
		'OFFSET_VULKAN_API_VERSION'
	],
	#category : 'SDL3-Base',
	#package : 'SDL3',
	#tag : 'Base'
}

{ #category : 'field definition' }
SDL3GPUVulkanOptions class >> fieldsDesc [

	^ #(
	Uint32 vulkan_api_version;
	void* feature_list;
	void* vulkan_10_physical_device_features;
	Uint32 device_extension_count;
	char** device_extension_names;
	Uint32 instance_extension_count;
	char** instance_extension_names
	)
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> deviceExtensionCount [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_DEVICE_EXTENSION_COUNT
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> deviceExtensionCount: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_DEVICE_EXTENSION_COUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> deviceExtensionNames [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DEVICE_EXTENSION_NAMES) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> deviceExtensionNames: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DEVICE_EXTENSION_NAMES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> featureList [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FEATURE_LIST) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> featureList: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FEATURE_LIST put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> instanceExtensionCount [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_INSTANCE_EXTENSION_COUNT
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> instanceExtensionCount: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INSTANCE_EXTENSION_COUNT put: anObject
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> instanceExtensionNames [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_INSTANCE_EXTENSION_NAMES) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> instanceExtensionNames: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_INSTANCE_EXTENSION_NAMES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> vulkan10PhysicalDeviceFeatures [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_VULKAN_10_PHYSICAL_DEVICE_FEATURES) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> vulkan10PhysicalDeviceFeatures: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VULKAN_10_PHYSICAL_DEVICE_FEATURES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> vulkanApiVersion [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VULKAN_API_VERSION
]

{ #category : 'accessing - structure variables' }
SDL3GPUVulkanOptions >> vulkanApiVersion: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VULKAN_API_VERSION put: anObject
]
