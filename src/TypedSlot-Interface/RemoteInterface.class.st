Class {
	#name : #RemoteInterface,
	#superclass : #Object,
	#instVars : [
		'interfaceSource'
	],
	#category : #'TypedSlot-Interface'
}

{ #category : #'instance creation' }
RemoteInterface class >> interfaceSource: anInterfaceSource [
	^ self new
		interfaceSource: anInterfaceSource;
		yourself
]

{ #category : #comparing }
RemoteInterface >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ interfaceSource = anObject interfaceSource
]

{ #category : #checking }
RemoteInterface >> checkObjectType: anObject [
	self interface checkObjectType: anObject
]

{ #category : #comparing }
RemoteInterface >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ interfaceSource hash
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
