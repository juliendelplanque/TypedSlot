Extension { #name : #Collection }

{ #category : #'*TypedSlot-Collection' }
Collection class >> of: aType [
	^ CollectionType new
		collectionType: self createType ;
		elementType: aType createType;
		yourself
]
