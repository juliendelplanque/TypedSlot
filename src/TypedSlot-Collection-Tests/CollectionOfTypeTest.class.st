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
	self shouldnt: [ (OrderedCollection of: Integer) checkObjectType: (OrderedCollection withAll: #(1 2 3)) ] raise: TypeViolation.
	self shouldnt: [ (OrderedCollection of: String) checkObjectType: (OrderedCollection withAll: #('a' 'abc' 'efg')) ] raise: TypeViolation.
	self shouldnt: [ (Set of: Integer) checkObjectType: (Set withAll: #(1 2 3)) ] raise: TypeViolation.
	self shouldnt: [ (Dictionary of: Float) checkObjectType: { 'x' -> 1.5. 42 -> 42.42} asDictionary ] raise: TypeViolation.
	self shouldnt: [ (OrderedCollection of: (Array of: String)) checkObjectType: (OrderedCollection withAll: #(#('a' 'abc') #('efg'))) ] raise: TypeViolation.
	
	self
		should: [ (OrderedCollection of: Integer) checkObjectType: 'string' ]
		raise: TypeViolation
		withExceptionDo: [ :typeViolation | 
			self assert: typeViolation expectedType equals: 
				(CollectionType new 
					collectionType: (SingleType new type: OrderedCollection); 
					elementType: (SingleType new type:Integer)).
			self assert: typeViolation objectAttemptedToBeWritten equals: 'string' ].
		
	self
		should: [ (OrderedCollection of: (Array of: String)) checkObjectType: (OrderedCollection withAll: #(#('a' 'abc') #(1 2 3))) ]
		raise: TypeViolation
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
	
	self shouldnt: [ (testSlot read: mockObject) add: 4 ] raise: TypeViolation.
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
	
	self shouldnt: [ testSlot write: (OrderedCollection withAll: #(1 2 3)) to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: (OrderedCollection withAll: #(1 2 3)).
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]

{ #category : #tests }
CollectionOfTypeTest >> testWriteTo2 [
	| testSlot mockObject |
	testSlot := MockObjectForTypedSlotUsingCollectionType slotNamed: #setCollectionSlot.
	mockObject := MockObjectForTypedSlotUsingCollectionType new.
	
	self shouldnt: [ testSlot write: (Set withAll: #('a' 'ab' 'd')) to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: (Set withAll: #('a' 'ab' 'd')).
	
	self shouldnt: [ testSlot write: nil to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
	
	self should: [ testSlot write: 'string' to: mockObject ] raise: TypeViolation.
	self assert: (testSlot read: mockObject) equals: nil.
]
