// Register a template definition set named "default".
CKEDITOR.addTemplates( 'default',
{
	// The name of the subfolder that contains the preview images of the templates.
	imagesPath : CKEDITOR.getUrl( CKEDITOR.plugins.getPath( 'templates' ) + 'templates/images/' ),
 
	// Template definitions.
	templates :
		[
			{
				title: 'My Template bertoa_assets',
				image: 'template1.gif',
				description: 'Description of My Template 1.',
				html:
					'<h2>Template 10000</h2>' +
					'<p><img src="/logo.png" style="float:left" />Type your text here.</p>'
			},
			{
				title: 'My Template bertoa2_assets',
				html:
					'<h3>Template 2</h3>' +
					'<p>Type your text here.</p>'
			}
		]
});