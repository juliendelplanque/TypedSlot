Extension { #name : #Association }

{ #category : #'*TypedSlotHogo' }
Association class >> keyType: aKeyType valueType: aValueType [
	^ AssociationType new
		keyType: aKeyType asConstraint ;
		valueType: aValueType asConstraint;
		yourself
]
