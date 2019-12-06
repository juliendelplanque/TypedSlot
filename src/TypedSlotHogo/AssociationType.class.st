"
I represent a collection type.
	
	Try This!
	creation:  #anAssociationTypedIV type: (Association keyType: Character valueType: SmallInteger).
	$a -> 1 is an Object that would fit this slot.

    Instance Variables
	My #keyType contains an abstract type.
	My #valueType contains an abstract type.

"
Class {
	#name : #AssociationType,
	#superclass : #AbstractCompositeType,
	#instVars : [
		'keyType',
		'valueType'
	],
	#category : #TypedSlotHogo
}

{ #category : #printing }
AssociationType class >> initialSelector [
	^ #type:
]

{ #category : #debug }
AssociationType >> allTypes [
	^ ( keyType allTypes + valueType allTypes ) asSet
]

{ #category : #testing }
AssociationType >> checkConstraint: anObject [
	(anObject isNil 
		or: [ (anObject isKindOf: Association ) 
		and: [ (anObject key = keyType) 
		and: [ anObject value = valueType ]]])
		ifFalse: [ self wasViolatedBy: anObject ]
]

{ #category : #printing }
AssociationType >> definitionStringOn: aStream [
	aStream nextPut: $(;
		print: Association;
		<< ' keyType: '.
	keyType definitionStringOn: aStream.
	aStream << ' valueType: '.
	valueType definitionStringOn: aStream.
	aStream nextPut: $).
]

{ #category : #comparing }
AssociationType >> hasSamePropertiesAs: anotherType [
	^ keyType = anotherType keyType and: [ valueType = anotherType valueType ]
]

{ #category : #comparing }
AssociationType >> hash [
	^ keyType hash + valueType hash 
]

{ #category : #accessing }
AssociationType >> keyType [
	^ keyType
]

{ #category : #accessing }
AssociationType >> keyType: aType [
	keyType := aType.
]

{ #category : #accessing }
AssociationType >> valueType [
	^ valueType
]

{ #category : #accessing }
AssociationType >> valueType: aType [
	valueType := aType.
]
