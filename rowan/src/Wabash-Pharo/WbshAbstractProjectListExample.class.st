Class {
	#name : 'WbshAbstractProjectListExample',
	#superclass : 'MorphTreeModel',
	#instVars : [
		'listService',
		'selected'
	],
	#category : 'Wabash-Pharo'
}

{ #category : 'opening' }
WbshAbstractProjectListExample class >> openOn: aListServiceClient [
	self new openOn: aListServiceClient
]

{ #category : 'view' }
WbshAbstractProjectListExample >> defaultTreeMorph [
	^ super defaultTreeMorph
		multiSelection: true;
		autoMultiSelection: true;
		yourself
]

{ #category : 'opening' }
WbshAbstractProjectListExample >> openOn: aListServiceClient [
	listService := aListServiceClient.
	(self defaultTreeMorph buildContents
		embeddedInMorphicWindowLabeled: self title)
		openInWorld.

]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> rootItems [
	self subclassResponsibility
]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> selected [
	^ selected ifNil: [selected := 1]
]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> selected: x [
	selected := x.
	self changed: #selected
]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> title [
	self subclassResponsibility
]
