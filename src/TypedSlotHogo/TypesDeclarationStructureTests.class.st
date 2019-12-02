"
This class contains structural tests for declarations of typed slots.


"
Class {
	#name : #TypesDeclarationStructureTests,
	#superclass : #TestCase,
	#category : #TypedSlotHogo
}

{ #category : #basic }
TypesDeclarationStructureTests >> testAnonymousInterfaceTypeOnArrayOfSelector [
	| slot |
	slot := #anIV understands: {#+} .
	self assert: slot type isInterfaceType.
	self assert: slot type interface name isNil.
	self assert: slot type interface selectors isArray.
	self assert: slot type equals: (AnonymousInterfaceConstraint new interface: (Interface selectors: #(#+)) ; yourself).
	self assert: slot definitionString equals: '#anIV understands: #(#+)'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testAnonymousInterfaceTypeOnSelector [
	| slot |
	slot :=#anIV understands: #+ .
	self assert: slot type isInterfaceType.
	self assert: slot type interface name isNil.
	self assert: slot type interface selectors isArray.
	self assert: slot type equals: (AnonymousInterfaceConstraint new interface:(Interface selectors: #(#+)) ; yourself).
	self assert: slot definitionString equals: '#anIV understands: #(#+)'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testAssociationType [
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
TypesDeclarationStructureTests >> testCollectionType [
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
TypesDeclarationStructureTests >> testCollectionTypeWithMultipleElementType [
	| slot |
	slot :=  #aCollectionTypedIV type: (Array of: {Character. SmallInteger}).
	self assert: slot type isCollectionType.
	self assert: slot type collectionType isSingleType.
	self assert: slot type elementType isMultipleType.

	self assert: slot type collectionType type equals: Array.
	self assert: slot type elementType types equals: {SingleType new type: Character; yourself. SingleType new type: SmallInteger ; yourself }.
	
	self assert: slot type equals:
			(CollectionType new 
				collectionType: (SingleType new type: Array; yourself);
				elementType: (MultipleType new types: {SingleType new type: Character; yourself. SingleType new type: SmallInteger ; yourself} ; yourself)).
	self assert: slot definitionString equals: '#aCollectionTypedIV type: (Array of: {Character.SmallInteger})'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testMultipleType [
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
TypesDeclarationStructureTests >> testNamedInterface [
	| slot |
	slot :=#anIV understands: InterfacePlus.
	self assert: slot type isInterfaceType.
	self assert: slot type interface selectors class = Set.
	self assert: slot type interface name equals: #InterfacePlus.
	self assert: slot type equals: (NamedInterfaceConstraint new interface: InterfacePlus new ; yourself).
	self assert: slot definitionString equals: '#anIV understands: InterfacePlus'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testSingleType [
	| slot |
	slot :=#anIV type: String.
	self assert: slot type isSingleType.
	self assert: slot type type equals: String.
	self assert: slot type equals: (SingleType new type:String; yourself).
	self assert: slot definitionString equals: '#anIV type: String'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testSingleTypeUsingAnArray [
	| slot |
	slot :=#anIV type: { String }.
	self assert: slot type isSingleType.
	self assert: slot type type equals: String.
	self assert: slot type equals: (SingleType new type:String; yourself).
	self assert: slot definitionString equals: '#anIV type: String'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testTraitType [
	| slot |
	slot := #testSlot mustUse: MockTraitForTests.
	self assert: slot type isTraitType.
	self assert: slot type trait equals: MockTraitForTests.
	self assert: slot type equals: (TraitConstraint new trait: MockTraitForTests ; yourself).
	self assert: slot definitionString equals: '#testSlot mustUse: MockTraitForTests'
]

{ #category : #basic }
TypesDeclarationStructureTests >> testValidatorType [
	| slot |
	slot :=#testSlot satisfy: [ :x | x > 0 ].
	self assert: slot type isValidator.
	self assert: slot type predicate isBlock.
	self assert: slot type predicate argumentCount equals: 1.
	self assert: slot type equals: (PredicateConstraint new predicate: [ :x | x > 0 ] ; yourself).
	self assert: slot definitionString equals: '#testSlot satisfy: [ :x | x > 0 ]'
]
