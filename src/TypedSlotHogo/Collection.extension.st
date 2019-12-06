Extension { #name : #Collection }

{ #category : #'*TypedSlotHogo' }
Collection >> asConstraint [
	^ CollectionType new 
		collectionType: self class asConstraint;
		elementType: self asArray asConstraint;
		yourself
]

{ #category : #'*TypedSlotHogo' }
Collection >> asTypeReification [
	^ self asConstraint
]
