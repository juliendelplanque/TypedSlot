Class {
	#name : #TypeImplicitTransformationTest,
	#superclass : #TestCase,
	#category : #TypedSlotHogo
}

{ #category : #tests }
TypeImplicitTransformationTest >> testMultipleTypeAddType [
	| type |
	type := MultipleType new types: { String. SmallInteger }.
	type addType: Character.
	self assert: type isMultipleType.
	self assert: type types equals: { String asTypeReification. SmallInteger asTypeReification. Character asTypeReification } asSet.
	self assert: type types size equals: 3
]

{ #category : #tests }
TypeImplicitTransformationTest >> testMultipleTypeAddTypeAlreadyIn [
	| type |
	type := MultipleType new types: { String. SmallInteger }.
	type addType: SmallInteger.
	self assert: type isMultipleType.
	self assert: type types equals: { String asTypeReification. SmallInteger asTypeReification } asSet.
	self assert: type types size equals: 2
]

{ #category : #tests }
TypeImplicitTransformationTest >> testMultipleTypeRemoveTypeBecomesSingle [
	| type |
	type := MultipleType new types: { String. SmallInteger }.
	type removeType: SmallInteger.
	self assert: type isSingleType.
	self assert: type type equals: String.
]

{ #category : #tests }
TypeImplicitTransformationTest >> testMultipleTypeRemoveTypeButStillMultiple [
	| type |
	type := MultipleType new types: { String. SmallInteger. Character }.
	type removeType: Character.
	self assert: type isMultipleType.
	self assert: type types equals: { String asTypeReification. SmallInteger asTypeReification } asSet.
	self assert: type types size equals: 2
]

{ #category : #tests }
TypeImplicitTransformationTest >> testMultipleTypeWithNoTypes [
	| type |
	type := MultipleType new types: {} ; yourself.
	self assert: type isEmptyType.
]

{ #category : #tests }
TypeImplicitTransformationTest >> testMultipleTypeWithOneType [
	| type |
	type := MultipleType new types: { String }; yourself.
	self assert: type isSingleType.
	self assert: type type equals: String
]

{ #category : #tests }
TypeImplicitTransformationTest >> testSingleTypeAddType [
	| type |
	type := SingleType new type: String.
	type addType: SmallInteger.
	self assert: type isMultipleType.
	self assert: type types equals: { String asTypeReification. SmallInteger asTypeReification } asSet.
]
