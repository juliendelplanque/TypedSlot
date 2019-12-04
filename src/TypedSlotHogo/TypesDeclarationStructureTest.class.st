"
This class contains structural tests for declarations of typed slots.


"
Class {
	#name : #TypesDeclarationStructureTest,
	#superclass : #TestCase,
	#category : #TypedSlotHogo
}

{ #category : #basic }
TypesDeclarationStructureTest >> testAnonymousInterfaceTypeOnArrayOfSelector [
	| slot |
	slot := #anIV understands: {#+} .
	self assert: slot type isInterfaceConstraint.
	self assert: slot type interface name isNil.
	self assert: slot type interface selectors isArray.
	self assert: slot type equals: (AnonymousInterfaceConstraint new interface: (Interface selectors: #(#+)) ; yourself).
	self assert: slot definitionString equals: '#anIV understands: #(#+)'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testAnonymousInterfaceTypeOnSelector [
	| slot |
	slot :=#anIV understands: #+ .
	self assert: slot type isInterfaceConstraint.
	self assert: slot type interface name isNil.
	self assert: slot type interface selectors isArray.
	self assert: slot type equals: (AnonymousInterfaceConstraint new interface:(Interface selectors: #(#+)) ; yourself).
	self assert: slot definitionString equals: '#anIV understands: #(#+)'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testAssociationType [
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
TypesDeclarationStructureTest >> testCollectionType [
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
TypesDeclarationStructureTest >> testCollectionTypeWithMultipleElementType [
	| slot |
	slot :=  #aCollectionTypedIV type: (Array of: {SmallInteger.Character}).
	self assert: slot type isCollectionType.
	self assert: slot type collectionType isSingleType.
	self assert: slot type elementType isMultipleType.

	self assert: slot type collectionType type equals: Array.
	self assert: slot type elementType types equals: {SingleType new type: Character; yourself. SingleType new type: SmallInteger ; yourself } asSet.
	
	self assert: slot type equals:
			(CollectionType new 
				collectionType: (SingleType new type: Array; yourself);
				elementType: (MultipleType new types: {SingleType new type: Character; yourself. SingleType new type: SmallInteger ; yourself} ; yourself)).
	self assert: slot definitionString equals: '#aCollectionTypedIV type: (Array of: {SmallInteger.Character})'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testMultipleType [
	| slot |
	slot := #aMultipleTypeIV type: {Float.SmallInteger}.
	self assert: slot type isMultipleType.
	self assert: slot type types isNotEmpty.
	slot type types do: [ :aType |
			self assert: aType isSingleType.
			self assert: ({SmallInteger. Float} includes: aType type) ].
	self assert: slot type equals:
			(MultipleType new types:
				{(SingleType new type: SmallInteger ; yourself).
				(SingleType new type: Float ; yourself)}).
	self assert: slot definitionString equals: '#aMultipleTypeIV type: {Float.SmallInteger}'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testNamedInterface [
	| slot |
	slot :=#anIV understands: InterfacePlus.
	self assert: slot type isInterfaceConstraint.
	self assert: slot type interface selectors class = Set.
	self assert: slot type interface name equals: #InterfacePlus.
	self assert: slot type equals: (NamedInterfaceConstraint new interface: InterfacePlus new ; yourself).
	self assert: slot definitionString equals: '#anIV understands: InterfacePlus'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testSingleType [
	| slot |
	slot :=#anIV type: String.
	self assert: slot type isSingleType.
	self assert: slot type type equals: String.
	self assert: slot type equals: (SingleType new type:String; yourself).
	self assert: slot definitionString equals: '#anIV type: String'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testSingleTypeUsingAnArray [
	| slot |
	slot :=#anIV type: { String }.
	self assert: slot type isSingleType.
	self assert: slot type type equals: String.
	self assert: slot type equals: (SingleType new type:String; yourself).
	self assert: slot definitionString equals: '#anIV type: String'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testTraitType [
	| slot |
	slot := #testSlot mustUse: MockTraitForTests.
	self assert: slot type isTraitConstraint.
	self assert: slot type trait equals: MockTraitForTests.
	self assert: slot type equals: (TraitConstraint new trait: MockTraitForTests ; yourself).
	self assert: slot definitionString equals: '#testSlot mustUse: MockTraitForTests'
]

{ #category : #basic }
TypesDeclarationStructureTest >> testValidatorType [
	| slot |
	slot :=#testSlot satisfy: [ :x | x > 0 ].
	self assert: slot type isPredicateConstraint.
	self assert: slot type predicate isBlock.
	self assert: slot type predicate argumentCount equals: 1.
	self assert: slot type equals: (PredicateConstraint new predicate: [ :x | x > 0 ] ; yourself).
	self assert: slot definitionString equals: '#testSlot satisfy: [ :x | x > 0 ]'
]
