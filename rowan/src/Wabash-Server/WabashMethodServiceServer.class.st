Class {
	#name : 'WabashMethodServiceServer',
	#superclass : 'WabashMethodService',
	#instVars : [
		'methodService',
		'metaclasMethodService'
	],
	#category : 'Wabash-Server'
}

{ #category : 'accessing' }
WabashMethodServiceServer >> _methodService [
	^methodService
]

{ #category : 'accessing' }
WabashMethodServiceServer >> _methodService: object [
	methodService := object
]
