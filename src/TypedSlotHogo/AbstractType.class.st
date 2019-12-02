"
I represent an of AbstractType

I declare what methods needs to be implemented to add my custom type.
I also declare class tester for the rest of the hierarchy, as well as offering a few methods.

I am usually in a TypedSlot to constrain what is written to a slot, or as a Type annotation for class understanding.
I can be put recursively into another type, for example: 
#aCollectionTypedIV type: (Array of: {Character. SmallInteger})

My subclasses need to define:
	-checkObjectType:
	-definitionStringOn:
	-hasSameTypeAs:

- TypeViolationWith: offer a way to throw a Type error
"
Class {
	#name : #AbstractType,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
AbstractType class >> initialSelector [
	"a symbol representing the selector of the message send to the symbol of the slot
	would return #type: in the following example: #anIV type: SmallInteger."
	self subclassResponsibility
]

{ #category : #testing }
AbstractType >> = anotherType [
	^ 	self == anotherType or:[ self class = anotherType class and: [ self hasSameTypeAs: anotherType ]]
]

{ #category : #debug }
AbstractType >> allTypes [
	" It should return all types used. Only for debug purpose"
	^ self subclassResponsibility 
]

{ #category : #creation }
AbstractType >> asTypeConstraint [
	"If it's in that hierarchy, it's already a type"
	^ self
]

{ #category : #testing }
AbstractType >> checkObjectType: anObject [
	"called by #write:to: to check that anObject satisfy the constraint, should raise a error otherwise"
	self subclassResponsibility
]

{ #category : #printing }
AbstractType >> definitionStringOn: aStream [
	"fills up the stream with what will be put after the initial selector in the class definition"
	self subclassResponsibility
]

{ #category : #testing }
AbstractType >> hasSameTypeAs: aType [
	"called by self >> #equal. Needs to implement this on the assumption that aType is the same class"
	" returns a boolean"
	^ self subclassResponsibility 
]

{ #category : #testing }
AbstractType >> isCollectionType [
	^ false
]

{ #category : #testing }
AbstractType >> isCompositeType [
	^ false
]

{ #category : #testing }
AbstractType >> isEmptyType [
	^ false
]

{ #category : #testing }
AbstractType >> isInterfaceType [
	^ false
]

{ #category : #testing }
AbstractType >> isMultipleType [
	^ false
]

{ #category : #testing }
AbstractType >> isSingleType [
	^ false
]

{ #category : #testing }
AbstractType >> isTraitType [
	^ false
]

{ #category : #testing }
AbstractType >> isValidator [
	^ false
]

{ #category : #error }
AbstractType >> typeViolationWith: anObject [
	(TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal
]
