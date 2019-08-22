Extension { #name : #Symbol }

{ #category : #'*TypedSlot-Interface' }
Symbol >> interface: anArrayOfSymbols [
	^ self type: (Interface selectors: anArrayOfSymbols)
]
