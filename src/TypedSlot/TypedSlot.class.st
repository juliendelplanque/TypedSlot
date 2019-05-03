Class {
	#name : #TypedSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'type'
	],
	#classInstVars : [
		'isEnabled'
	],
	#category : #'TypedSlot-Core'
}

{ #category : #accessing }
TypedSlot class >> isEnabled [
	^ isEnabled ifNil: [ isEnabled := true ]
]

{ #category : #accessing }
TypedSlot class >> isEnabled: anObject [
	isEnabled := anObject
]

{ #category : #'instance creation' }
TypedSlot class >> named: aSymbol type: aTypeableObject [

	^(super named: aSymbol) type: aTypeableObject
]

{ #category : #settings }
TypedSlot class >> settingsOn: aBuilder [ 
	<systemsettings>
	(aBuilder setting: #'Type checking at runtime') 
		target: self;
		description: 'Enables type checking at runtime using TypedSlot.';
		selector: #isEnabled;
		iconName: #smallConfigurationIcon;
		parent: #tools
]

{ #category : #comparing }
TypedSlot >> = anObject [ 

	^super = anObject and: [ self type = anObject type ]
]

{ #category : #'meta-object-protocol' }
TypedSlot >> checkTypeOfValue: newValue [
	self isEnabled
		ifFalse: [ ^ self ].
	newValue ifNil: [ ^ self ].
	
	type checkObjectType: newValue
]

{ #category : #printing }
TypedSlot >> definitionString [
	^ String streamContents: [ :stream |
		self definitionStringOn: stream ]
]

{ #category : #printing }
TypedSlot >> definitionStringOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name.
	aStream
		nextPutAll: ' type: '.
	self type printOn: aStream
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

{ #category : #accessing }
TypedSlot >> isEnabled [
	^ self class isEnabled
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
