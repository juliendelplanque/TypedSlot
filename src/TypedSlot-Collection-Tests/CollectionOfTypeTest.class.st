"
A CollectionOfTypeTest is a test class for testing the behavior of CollectionOfType
"
Class {
	#name : #CollectionOfTypeTest,
	#superclass : #TestCase,
	#category : #'TypedSlot-Collection-Tests'
}

{ #category : #tests }
CollectionOfTypeTest >> testCheckObjectType [
	self shouldnt: [ (OrderedCollection of: Integer) checkConstraint: (OrderedCollection withAll: #(1 2 3)) ] raise: ConstraintViolation.
	self shouldnt: [ (OrderedCollection of: String) checkConstraint: (OrderedCollection withAll: #('a' 'abc' 'efg')) ] raise: ConstraintViolation.
	self shouldnt: [ (Set of: Integer) checkConstraint: (Set withAll: #(1 2 3)) ] raise: ConstraintViolation.
	self shouldnt: [ (Dictionary of: Float) checkConstraint: { 'x' -> 1.5. 42 -> 42.42} asDictionary ] raise: ConstraintViolation.
	self shouldnt: [ (OrderedCollection of: (Array of: String)) checkConstraint: (OrderedCollection withAll: #(#('a' 'abc') #('efg'))) ] raise: ConstraintViolation.
	
	self
		should: [ (OrderedCollection of: Integer) checkConstraint: 'string' ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: 
				(CollectionType new 
					collectionType: (SingleType new type: OrderedCollection); 
					elementType: (SingleType new type:Integer)).
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ].
		
	self
		should: [ (OrderedCollection of: (Array of: String)) checkConstraint: (OrderedCollection withAll: #(#('a' 'abc') #(1 2 3))) ]
		raise: ConstraintViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: (SingleType new type: String ; yourself).
			self assert: typeViolation objectAttemptedToBeWritten equals: 1 ].
]

{ #category : #tests }
CollectionOfTypeTest >> testRead [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingCollectionType slotNamed: #orderedCollectionSlot.
	mockObject := MockObjectForTypedSlotUsingCollectionType new.
	
	testSlot write: (OrderedCollection withAll: #(1 2 3)) to: mockObject.
	
	self shouldnt: [ (testSlot read: mockObject) add: 4 ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: (OrderedCollection withAll: #(1 2 3 4)).
	
	self flag: #TODO. "Not working."
	"self should: [ (testSlot read: mockObject) add: $a ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: (OrderedCollection withAll: #(1 2 3 4))."
]

{ #category : #tests }
CollectionOfTypeTest >> testWriteTo [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingCollectionType slotNamed: #orderedCollectionSlot.
	mockObject := MockObjectForTypedSlotUsingCollectionType new.
	
	self shouldnt: [ testSlot write: (OrderedCollection withAll: #(1 2 3)) to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: (OrderedCollection withAll: #(1 2 3)).
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]

{ #category : #tests }
CollectionOfTypeTest >> testWriteTo2 [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingCollectionType slotNamed: #setCollectionSlot.
	mockObject := MockObjectForTypedSlotUsingCollectionType new.
	
	self shouldnt: [ testSlot write: (Set withAll: #('a' 'ab' 'd')) to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: (Set withAll: #('a' 'ab' 'd')).
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: ConstraintViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
