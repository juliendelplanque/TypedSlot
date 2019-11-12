Extension { #name : #Object }

{ #category : #'*TypedSlotHogo' }
Object >> createType [
	^ SingleType new type: self ; yourself
]

{ #category : #'*TypedSlotHogo' }
Object >> definitionStringOn: aStream [
	aStream print: self
]
