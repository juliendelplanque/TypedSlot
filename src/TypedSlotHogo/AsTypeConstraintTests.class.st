Class {
	#name : #AsTypeConstraintTests,
	#superclass : #TestCase,
	#category : #TypedSlotHogo
}

{ #category : #scope }
AsTypeConstraintTests >> testArrayClass [
	| type |
	" Checks that this returns a Single type, unlike an instance of Array "
	type := Array asTypeConstraint.
	self assert: type isSingleType.
	self assert: type type equals: Array
]

{ #category : #collection }
AsTypeConstraintTests >> testArrayOneElement [
	| type |
	type := { String } asTypeConstraint.
	self assert: type isSingleType.
	self assert: type type equals: String.
]

{ #category : #collection }
AsTypeConstraintTests >> testArrayTwoElement [
	| type |
	type := { String. SmallInteger } asTypeConstraint.
	self assert: type isMultipleType.
	self assert: type types equals: { SingleType new type: String; yourself. SingleType new type: SmallInteger; yourself } asOrderedCollection.
]

{ #category : #scope }
AsTypeConstraintTests >> testBlockClosureClass [
	| type |
	" Checks that this returns a Single type, unlike an instance of BlockClosure "
	type := BlockClosure asTypeConstraint.
	self assert: type isSingleType.
	self assert: type type equals: BlockClosure
]

{ #category : #basic }
AsTypeConstraintTests >> testClass [
	| type |
	type := String asTypeConstraint.
	self assert: type isSingleType.
	self assert: type type equals: String
]

{ #category : #scope }
AsTypeConstraintTests >> testCollectionClass [
	| type |
	" Checks that this returns a Single type, unlike an instance of Collection "
	type := Collection asTypeConstraint.
	self assert: type isSingleType.
	self assert: type type equals: Collection
]

{ #category : #basic }
AsTypeConstraintTests >> testNonMetaInstance [
	self should: [ 1 asTypeConstraint ] raise: MessageNotUnderstood 
]

{ #category : #collection }
AsTypeConstraintTests >> testOrderCollectionOfString [
	| type |
	type := { String } asOrderedCollection asTypeConstraint.
	self assert: type isCollectionType.
	self assert: type collectionType equals: (SingleType new type: OrderedCollection ; yourself).
	self assert: type elementType equals: (SingleType new type: String; yourself).
]

{ #category : #basic }
AsTypeConstraintTests >> testPredicate [
	| type |
	" Checks that this returns a Single type, unlike an instance of Trait "
	type := [:a | a < 2 ] asTypeConstraint.
	self assert: type isPredicateConstraint.
	self assert: (type predicate isKindOf: BlockClosure).
	self assert: type predicate sourceNode equals: [:a | a < 2 ] sourceNode.
]

{ #category : #collection }
AsTypeConstraintTests >> testSetOfString [
	| type |
	type := { String } asSet asTypeConstraint.
	self assert: type isCollectionType.
	self assert: type collectionType equals: (SingleType new type: Set ; yourself).
	self assert: type elementType equals: (SingleType new type: String; yourself).
]

{ #category : #basic }
AsTypeConstraintTests >> testTrait [
	| type |
	" Checks that this returns a Single type, unlike an instance of Trait "
	type := MockTraitForTests asTypeConstraint.
	self assert: type isTraitConstraint.
	self assert: type trait equals: MockTraitForTests.
]

{ #category : #scope }
AsTypeConstraintTests >> testTraitClass [
	| type |
	" Checks that this returns a Single type, unlike an instance of Trait "
	type := Trait asTypeConstraint.
	self assert: type isSingleType.
	self assert: type type equals: Trait.
	
]
