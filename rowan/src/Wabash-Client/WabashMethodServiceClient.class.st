Class {
	#name : 'WabashMethodServiceClient',
	#superclass : 'WabashMethodService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashMethodServiceClient >> methodName [
	^ remoteSelf methodName wait
]
