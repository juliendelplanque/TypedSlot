Extension { #name : #Collection }

{ #category : #'*TypedSlot-Collection' }
Collection class >> of: aType [
	^ CollectionType new
		collectionType: self asTypeConstraint ;
		elementType: aType asTypeConstraint;
		yourself
]
