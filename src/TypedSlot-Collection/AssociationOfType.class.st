Class {
	#name : #AssociationOfType,
	#superclass : #CollectionOfType,
	#category : #'TypedSlot-Collection'
}

{ #category : #accessing }
AssociationOfType >> keyType [
	^ collectionType
]

{ #category : #accessing }
AssociationOfType >> valueType [ 
	^ itemsType
]
