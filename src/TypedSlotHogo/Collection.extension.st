Extension { #name : #Collection }

{ #category : #'*TypedSlotHogo' }
Collection >> asTypeConstraint [
	^ CollectionType new 
		collectionType: self class asTypeConstraint;
		elementType: self asArray asTypeConstraint;
		yourself
]
