Extension { #name : #BlockClosure }

{ #category : #'*TypedSlot-Block' }
BlockClosure >> checkObjectType: anObject [
	(self value: anObject)
		ifFalse: [ self error: 'This kind of object can not be stored by the slot (validation block returned false).' ]
]
