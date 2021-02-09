using { cuid } from '@sap/cds/common';

namespace my.bookshop;

entity Books: cuid {
  title  : String;
  stock  : Integer;
}

annotate Books with @(
	Common.SemanticKey: [title],
	UI: {
		Identification: [{Value:title}],
		SelectionFields: [ title ],
		HeaderInfo: {
			TypeName: '{i18n>Book}',
			TypeNamePlural: '{i18n>Books}',
			Title: {Value: title},
		},
		LineItem:[
			{Value: title},
			{Value: stock},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'},
		],
		FieldGroup#Details: {
			Data: [
				{Value: title},
				{Value: stock},
			]
		},
	}
);