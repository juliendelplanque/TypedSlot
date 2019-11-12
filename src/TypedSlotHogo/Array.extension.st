Extension { #name : #Array }

{ #category : #'*TypedSlotHogo' }
Array >> createType [
	^ MultipleType new types: (self collect: [:aType| aType createType ]) ; yourself
]
