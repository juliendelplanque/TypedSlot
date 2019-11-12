Class {
	#name : #RemoteInterface,
	#superclass : #Object,
	#instVars : [
		'interfaceSource',
		'interfaceSelector'
	],
	#category : #'TypedSlot-Interface'
}

{ #category : #accessing }
RemoteInterface class >> defaultInterfaceSelector [
	^ #interface
]

{ #category : #accessing }
RemoteInterface class >> initialSelector [ 
	^ #interface: 
]

{ #category : #'instance creation' }
RemoteInterface class >> source: anInterfaceSource [
	^ self source: anInterfaceSource interfaceSelector: self defaultInterfaceSelector
]

{ #category : #'instance creation' }
RemoteInterface class >> source: anInterfaceSource interfaceSelector: aSymbol [
	^ self new
		source: anInterfaceSource;
		interfaceSelector: aSymbol;
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

{ #category : #accessing }
RemoteInterface >> defaultInterfaceSelector [
	^ self class defaultInterfaceSelector
]

{ #category : #testing }
RemoteInterface >> hasFullControlOnDefinitionString [
	^ false
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
RemoteInterface >> interfaceSelector [
	^ interfaceSelector
]

{ #category : #accessing }
RemoteInterface >> interfaceSelector: anObject [
	interfaceSelector := anObject
]

{ #category : #accessing }
RemoteInterface >> interfaceSource [
	^ interfaceSource
]

{ #category : #printing }
RemoteInterface >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #accessing }
RemoteInterface >> selectors [
	^ self interface selectors
]

{ #category : #accessing }
RemoteInterface >> source: anObject [
	interfaceSource := anObject
]

{ #category : #printing }
RemoteInterface >> storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self className.
	aStream nextPut: Character space.
	aStream nextPutAll: 'source: '.
	self interfaceSource storeOn: aStream.
	self interfaceSelector = self defaultInterfaceSelector
		ifFalse: [ 
			aStream nextPutAll: ' interfaceSelector: '.
			self interfaceSelector storeOn: aStream ].
	aStream nextPut: $)
]
