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
	^ self subclassResponsibility
]

{ #category : #testing }
AbstractType >> = anotherType [
	^ self class = anotherType class and: [ self hasSameTypeAs: anotherType ]
]

{ #category : #testing }
AbstractType >> checkObjectType: anObject [
	self subclassResponsibility
]

{ #category : #creation }
AbstractType >> createType [
	"If it's in that hierarchy, it's already a type"
	^ self
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
