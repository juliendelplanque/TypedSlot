Class {
	#name : #TSObjectUsingTypedSlots,
	#superclass : #Object,
	#instVars : [
		'#stringSlot => TypedSlot type: String',
		'#integerSlot => TypedSlot type: Integer',
		'#normalSlot',
		'#usingTraitSlot => TypedSlot type: TSTraitForTests',
		'#usingInterfaceSlot => TypedSlot type: (InterfaceChecker interfaceSource: FooableObject)'
	],
	#category : #'TypedSlot-Tests'
}

{ #category : #accessing }
TSObjectUsingTypedSlots >> integerSlot [
	^ integerSlot
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> integerSlot: anObject [
	integerSlot := anObject
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> normalSlot [
	^ normalSlot
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> normalSlot: anObject [
	normalSlot := anObject
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> stringSlot [
	^ stringSlot
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> stringSlot: anObject [
	stringSlot := anObject
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> usingInterfaceSlot [
	^ usingInterfaceSlot
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> usingInterfaceSlot: anObject [
	usingInterfaceSlot := anObject
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> usingTraitSlot [
	^ usingTraitSlot
]

{ #category : #accessing }
TSObjectUsingTypedSlots >> usingTraitSlot: anObject [
	usingTraitSlot := anObject
]
