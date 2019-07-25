Class {
	#name : #TypedSlot,
	#superclass : #IndexedSlot,
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

{ #category : #checking }
TypedSlot >> checkTypeOfCurrentValueFor: anObject [
	"Checks the type of current value held by the slot in anObject.
	 Does the check even if type checking is not enabled.
	 This method is not called automatically.
	"
	| currentValue |
	currentValue := self read: anObject.
	currentValue ifNil: [ ^ self ].
	self type checkObjectType: currentValue
]

{ #category : #checking }
TypedSlot >> checkTypeOfValue: newValue for: anObject [
	(self isEnabledFor: anObject)
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
TypedSlot >> emitValue: methodBuilder [

	methodBuilder pushInstVar: index.

]

{ #category : #comparing }
TypedSlot >> hasSameDefinitionAs: otherSlot [

	^ (super hasSameDefinitionAs: otherSlot) 
		and: [ self definitionString = otherSlot definitionString ]
]

{ #category : #comparing }
TypedSlot >> hash [
	^ super hash bitXor: self type hash
]

{ #category : #initialization }
TypedSlot >> initialize [
	super initialize.
	self type: Object
]

{ #category : #accessing }
TypedSlot >> isEnabledFor: anObject [
	"If the global setting is set to disabled, we do not go further."
	^ self class isEnabled
		and: [ anObject isTypeCheckingEnabled ] "Else, we ask the instance if it wants type-checking."
]

{ #category : #testing }
TypedSlot >> isTypedSlot [
	^ true
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
	self checkTypeOfValue: newValue for: anObject.
	
	^ super write: newValue to: anObject
]
