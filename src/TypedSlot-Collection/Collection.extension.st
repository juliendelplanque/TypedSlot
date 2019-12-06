Extension { #name : #Collection }

{ #category : #'*TypedSlot-Collection' }
Collection class >> of: aType [
	^ CollectionType new
		collectionType: self asConstraint ;
		elementType: aType asConstraint;
		yourself
]
