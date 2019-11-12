Extension { #name : #Association }

{ #category : #'*TypedSlotHogo' }
Association class >> keyType: aKeyType valueType: aValueType [
	^ AssociationType new
		keyType: aKeyType createType ;
		valueType: aValueType createType;
		yourself
]
