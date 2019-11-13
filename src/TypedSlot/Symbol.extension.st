Extension { #name : #Symbol }

{ #category : #'*TypedSlot' }
Symbol >> asInterfaceConstraint [
	^ { self } asInterfaceConstraint
]

{ #category : #'*TypedSlot' }
Symbol >> satisfy: aPredicate [
	^ self type: aPredicate
]

{ #category : #'*TypedSlot' }
Symbol >> type: aType [
	^ self => TypedSlot type: aType asTypeConstraint
]

{ #category : #'*TypedSlot' }
Symbol >> understands: anInterface [
	^ self => TypedSlot type: anInterface asInterfaceConstraint
]

{ #category : #'*TypedSlot' }
Symbol >> uses: aTrait [
	^ self type: aTrait
]
