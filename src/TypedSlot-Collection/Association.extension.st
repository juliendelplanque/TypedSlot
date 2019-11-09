Extension { #name : #Association }

{ #category : #'*TypedSlot-Collection' }
Association class >> of: anArrayOfType [
	anArrayOfType size = 2
		ifFalse: [ self
				error:
					'An Association needs a type for a key, and a type for the kind of values. If several types are needed for either, use arrays of arrays' ].
	^ AssociationOfType new
		collectionType: (anArrayOfType at: 1);
		itemsType: (anArrayOfType at: 2);
		yourself
]
