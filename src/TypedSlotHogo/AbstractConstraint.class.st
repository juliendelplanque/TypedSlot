"
I represent an of AbstractConstraint for ConstrainedSlots.

I declare what methods needs to be implemented to add my custom constraint.
I also declare class tester for the rest of the hierarchy, as well as offering a few methods.

I am usually in a ConstraintSlot to constrain what is written to a slot, or as an annotation for class understanding.

My subclasses need to define (see definition for precision):
	- checkConstraint:
	- definitionStringOn:
	- hasSamePropertiesAs:

- wasViolatedBy: offer a way to throw a ConstraintViolation easily

"
Class {
	#name : #AbstractConstraint,
	#superclass : #Object,
	#category : #TypedSlotHogo
}

{ #category : #printing }
AbstractConstraint class >> initialSelector [
	"a symbol representing the selector of the message send to the symbol of the slot
	would return #type: in the following example: #anIV type: SmallInteger."
	self subclassResponsibility
]

{ #category : #comparing }
AbstractConstraint >> = anotherType [
	^ self == anotherType or: [ self class = anotherType class and: [ self hasSamePropertiesAs: anotherType ]]
]

{ #category : #creation }
AbstractConstraint >> asConstraint [
	"If it's in this class hierarchy, it's already a type"
	^ self
]

{ #category : #testing }
AbstractConstraint >> checkConstraint: anObject [
	"called by #write:to: to check that anObject satisfy the constraint, should raise a error otherwise"
	self subclassResponsibility
]

{ #category : #printing }
AbstractConstraint >> definitionStringOn: aStream [
	"fills up the stream with what will be put after the initial selector in the class definition"
	self subclassResponsibility
]

{ #category : #comparing }
AbstractConstraint >> hasSamePropertiesAs: aType [
	"called by self >> #equal. Needs to implement this on the assumption that aType is the same class"
	" returns a boolean"
	^ self subclassResponsibility 
]

{ #category : #comparing }
AbstractConstraint >> hash [
	" blocks Object >> #hash, necessary since we overload #="
 	^ self subclassResponsibility
]

{ #category : #testing }
AbstractConstraint >> isCollectionType [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isCollectionTypeConstraint [
	"Also available for naming consistency"
	^ self isCollectionType
]

{ #category : #testing }
AbstractConstraint >> isCompositeType [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isCompositeTypeContraint [
	"Also available for naming consistency"
	^ self isCompositeType
]

{ #category : #testing }
AbstractConstraint >> isEmptyType [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isEmptyTypeContraint [
	"Also available for naming consistency"
	^ self isEmptyType
]

{ #category : #testing }
AbstractConstraint >> isInterfaceConstraint [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isMultipleType [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isMultipleTypeContraint [
	"Also available for naming consistency"
	^ self isMultipleType
]

{ #category : #testing }
AbstractConstraint >> isPredicateConstraint [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isSingleType [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isSingleTypeContraint [
	"Also available for naming consistency"
	^ self isSingleType
]

{ #category : #testing }
AbstractConstraint >> isTraitConstraint [
	^ false
]

{ #category : #testing }
AbstractConstraint >> isTypeConstraint [
	^ false
]

{ #category : #error }
AbstractConstraint >> wasViolatedBy: anObject [
	(ConstraintViolation expectedType: self objectAttemptedToBeWritten: anObject) signal
]
