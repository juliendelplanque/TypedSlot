Extension { #name : #Object }

{ #category : #'*TypedSlot' }
Object class >> isTypeCheckingEnabled [
	^ false
]

{ #category : #'*TypedSlot' }
Object >> isTypeCheckingEnabled [
	^ self class isTypeCheckingEnabled
]
