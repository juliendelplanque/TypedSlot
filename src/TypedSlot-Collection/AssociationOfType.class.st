Class {
	#name : #AssociationOfType,
	#superclass : #CollectionOfType,
	#category : #'TypedSlot-Collection'
}

{ #category : #accessing }
AssociationOfType >> keyType [
	^ collectionType
]

{ #category : #printing }
AssociationOfType >> storeOn: aStream [
	aStream nextPut: $(.
	aStream nextPutAll: self class name.
	aStream nextPutAll: ' of: {';
		print: self keyType;
		<< $,;
		print: self valueType.
	
	aStream nextPutAll: '})'
]

{ #category : #accessing }
AssociationOfType >> valueType [ 
	^ itemsType
]
