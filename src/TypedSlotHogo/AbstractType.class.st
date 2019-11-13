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
	^ #understands:
]

{ #category : #testing }
AbstractType >> = anotherType [
	^ 	self == anotherType or:[ self class = anotherType class and: [ self hasSameTypeAs: anotherType ]]
]

{ #category : #creation }
AbstractType >> asTypeConstraint [
	"If it's in that hierarchy, it's already a type"
	^ self
]

{ #category : #testing }
AbstractType >> checkObjectType: anObject [
	self subclassResponsibility
]

{ #category : #printing }
AbstractType >> definitionStringOn: aStream [
	^ self subclassResponsibility
]

{ #category : #testing }
AbstractType >> hasSameTypeAs: aType [
	self subclassResponsibility 
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

{ #category : #error }
AbstractType >> typeViolationWith: anObject [
	(TypeViolation expectedType: self objectAttemptedToBeWritten: anObject) signal
]
