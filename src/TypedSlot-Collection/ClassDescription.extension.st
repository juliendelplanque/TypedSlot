Extension { #name : #ClassDescription }

{ #category : #'*TypedSlot-Collection' }
ClassDescription >> withItemsType: aType [
	^ CollectionOfType new
		collectionType: self;
		itemsType: aType;
		yourself
]
