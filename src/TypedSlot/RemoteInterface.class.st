Class {
	#name : #RemoteInterface,
	#superclass : #Object,
	#instVars : [
		'interfaceSource'
	],
	#category : #'TypedSlot-Core'
}

{ #category : #'instance creation' }
RemoteInterface class >> interfaceSource: anInterfaceSource [
	^ self new
		interfaceSource: anInterfaceSource;
		yourself
]

{ #category : #checking }
RemoteInterface >> checkObjectType: anObject [
	self interface checkObjectType: anObject
]

{ #category : #accessing }
RemoteInterface >> interface [
	^ self interfaceSource interface
]

{ #category : #accessing }
RemoteInterface >> interfaceSource [
	^ interfaceSource
]

{ #category : #accessing }
RemoteInterface >> interfaceSource: anObject [
	interfaceSource := anObject
]

{ #category : #printing }
RemoteInterface >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #accessing }
RemoteInterface >> selectors [
	^ self interface selectors
]

{ #category : #printing }
RemoteInterface >> storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self className.
	aStream nextPut: Character space.
	aStream nextPutAll: 'interfaceSource: '.
	self interfaceSource storeOn: aStream.
	aStream nextPut: $)
]
