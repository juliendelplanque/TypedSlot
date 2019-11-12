Extension { #name : #Symbol }

{ #category : #'*TypedSlot' }
Symbol >> satisfy: aPredicate [
	^ self type: aPredicate
]

{ #category : #'*TypedSlot' }
Symbol >> type: aType [
	^ self => TypedSlot type: aType createType
]
