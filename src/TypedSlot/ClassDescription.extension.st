Extension { #name : #ClassDescription }

{ #category : #'*TypedSlot' }
ClassDescription >> checkObjectType: anObject [
	(anObject isKindOf: self)
		ifFalse: [ self error: 'This kind of object can not be stored by the slot.' ]
]
