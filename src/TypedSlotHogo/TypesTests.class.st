Class {
	#name : #TypesTests,
	#superclass : #TestCase,
	#category : #TypedSlotHogo
}

{ #category : #basic }
TypesTests >> testAssociationType [
	| slot |
	slot :=  #anAssociationTypedIV type: (Association keyType: Character valueType: SmallInteger).
	self assert: slot type isCompositeType.
	self assert: slot type keyType isSingleType.
	self assert: slot type valueType isSingleType.

	self assert: slot type keyType type equals: Character.
	self assert: slot type valueType type equals: SmallInteger.
	
	self assert: slot type equals:
			(AssociationType new 
				keyType: (SingleType new type:Character; yourself);
				valueType: (SingleType new type: SmallInteger; yourself)).
	self assert: slot definitionString equals: '#anAssociationTypedIV type: (Association keyType: Character valueType: SmallInteger)'
]

{ #category : #basic }
TypesTests >> testCollectionType [
	| slot |
	slot :=  #aCollectionTypedIV type: (Array of: Character).
	self assert: slot type isCollectionType.
	self assert: slot type collectionType isSingleType.
	self assert: slot type elementType isSingleType.

	self assert: slot type collectionType type equals: Array.
	self assert: slot type elementType type equals: Character.
	
	self assert: slot type equals:
			(CollectionType new 
				collectionType: (SingleType new type: Array; yourself);
				elementType: (SingleType new type: Character; yourself)).
	self assert: slot definitionString equals: '#aCollectionTypedIV type: (Array of: Character)'
]

{ #category : #basic }
TypesTests >> testMultipleType [
	| slot |
	slot := #aMultipleTypeIV type: {SmallInteger. Float}.
	self assert: slot type isMultipleType.
	self assert: slot type types isNotEmpty.
	slot type types do: [ :aType |
			self assert: aType isSingleType.
			self assert: ({SmallInteger. Float} includes: aType type) ].
	self assert: slot type equals:
			(MultipleType new types:
				{(SingleType new type: SmallInteger ; yourself).
				(SingleType new type: Float ; yourself)}).
	self assert: slot definitionString equals: '#aMultipleTypeIV type: {SmallInteger.Float}'
]

{ #category : #basic }
TypesTests >> testSingleType [
	| slot |
	slot :=#anIV type: String.
	self assert: slot type isSingleType.
	self assert: slot type type equals: String.
	self assert: slot type equals: (SingleType new type:String; yourself).
	self assert: slot definitionString equals: '#anIV type: String'
]
