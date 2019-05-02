Class {
	#name : #InterfaceChecker,
	#superclass : #Object,
	#instVars : [
		'interfaceSource'
	],
	#category : #'TypedSlot-Core'
}

{ #category : #'instance creation' }
InterfaceChecker class >> interfaceSource: anInterfaceSource [
	^ self new
		interfaceSource: anInterfaceSource;
		yourself
]

{ #category : #checking }
InterfaceChecker >> checkObjectType: anObject [
	(anObject class selectors includesAll: self selectors)
		ifFalse: [ self error: 'This kind of object can not be stored by the slot. It needs to implement the required interface.' ]
]

{ #category : #accessing }
InterfaceChecker >> interface [
	^ self interfaceSource interface
]

{ #category : #accessing }
InterfaceChecker >> interfaceSource [
	^ interfaceSource
]

{ #category : #accessing }
InterfaceChecker >> interfaceSource: anObject [
	interfaceSource := anObject
]

{ #category : #accessing }
InterfaceChecker >> selectors [
	^ self interface selectors
]

{ #category : #printing }
InterfaceChecker >> storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self className.
	aStream nextPut: Character space.
	aStream nextPutAll: 'interfaceSource: '.
	self interfaceSource storeOn: aStream.
	aStream nextPut: $)
]
