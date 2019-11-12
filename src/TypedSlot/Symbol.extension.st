Extension { #name : #Symbol }

{ #category : #'*TypedSlot' }
Symbol >> interface: anArrayOfSymbols [
	^ self type: (Interface selectors: anArrayOfSymbols)
]

{ #category : #'*TypedSlot' }
Symbol >> satisfy: aPredicate [
	^ self type: aPredicate
]

{ #category : #'*TypedSlot' }
Symbol >> type: aType [
	^ self => TypedSlot type: aType createType
]

{ #category : #'*TypedSlot' }
Symbol >> uses: aTrait [
	^ self type: aTrait
]
