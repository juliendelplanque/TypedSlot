Class {
	#name : #MockObjectUsingTypedSlots,
	#superclass : #Object,
	#instVars : [
		'#integerSlot type: Integer',
		'#isTypeCheckingEnabled'
	],
	#classInstVars : [
		'#isTypeCheckingEnabled'
	],
	#category : #'TypedSlot-Tests'
}

{ #category : #accessing }
MockObjectUsingTypedSlots class >> isTypeCheckingEnabled [
	^ isTypeCheckingEnabled ifNil: [ isTypeCheckingEnabled := true ]
]

{ #category : #accessing }
MockObjectUsingTypedSlots class >> isTypeCheckingEnabled: aBoolean [
	isTypeCheckingEnabled := aBoolean
]

{ #category : #accessing }
MockObjectUsingTypedSlots >> integerSlot [
	^ integerSlot
]

{ #category : #accessing }
MockObjectUsingTypedSlots >> integerSlot: anObject [
	integerSlot := anObject
]

{ #category : #testing }
MockObjectUsingTypedSlots >> isTypeCheckingEnabled [
	"We allow instances to override the type-checking policy of the class and of the whole system.
	 That is to say, if type-checking is globally disabled and class-disabled, it can still be enabled at instance level if #isTypeCheckingEnabled inst. var. is true."
	^ isTypeCheckingEnabled ifNil: [ self class isTypeCheckingEnabled ]
]

{ #category : #testing }
MockObjectUsingTypedSlots >> isTypeCheckingEnabled: aBoolean [
	isTypeCheckingEnabled := aBoolean
]
