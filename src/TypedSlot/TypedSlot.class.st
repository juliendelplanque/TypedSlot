Class {
	#name : #TypedSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'type'
	],
	#category : #'TypedSlot-Core'
}

{ #category : #'instance creation' }
TypedSlot class >> named: aSymbol type: aTypeableObject [

	^(super named: aSymbol) type: aTypeableObject
]

{ #category : #comparing }
TypedSlot >> = anObject [ 

	^super = anObject and: [ self type = anObject type ]
]

{ #category : #'meta-object-protocol' }
TypedSlot >> checkTypeOfValue: newValue [
	newValue ifNil: [ ^ self ].
	
	type checkObjectType: newValue
]

{ #category : #'code generation' }
TypedSlot >> emitStore: aMethodBuilder [
	| tempName |
	tempName := Object new.
	aMethodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushReceiver;
		pushLiteralVariable: #slot -> self;
		pushTemp: tempName;
		send: #writeSlot:value:
]

{ #category : #comparing }
TypedSlot >> hasSameDefinitionAs: otherSlot [

	^ (super hasSameDefinitionAs: otherSlot) 
		and: [ self type storeString = otherSlot type storeString ]
]

{ #category : #comparing }
TypedSlot >> hash [
	^ ((self species hash bitXor: self name hash) 
			bitXor: (self index ifNil: [ 0 ])) 
				bitXor: self type hash
]

{ #category : #initialization }
TypedSlot >> initialize [
	super initialize.
	self type: Object
]

{ #category : #printing }
TypedSlot >> printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name.
	aStream
		nextPutAll: ' type: '.
	self type storeOn: aStream.

]

{ #category : #accessing }
TypedSlot >> type [
	^ type
]

{ #category : #accessing }
TypedSlot >> type: anObject [
	type := anObject
]

{ #category : #'meta-object-protocol' }
TypedSlot >> write: newValue to: anObject [
	newValue isNotNil
		ifTrue: [ self checkTypeOfValue: newValue ].
	
	^ super write: newValue to: anObject
]
