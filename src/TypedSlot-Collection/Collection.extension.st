Extension { #name : #Collection }

{ #category : #'*TypedSlot-Collection' }
Collection class >> of: aType [
	^ CollectionOfType new
		collectionType: self;
		itemsType: aType;
		yourself
]

{ #category : #'*TypedSlot-Collection' }
Collection class >> withItemsType: aType [
	^ CollectionOfType new
		collectionType: self;
		itemsType: aType;
		yourself
]
