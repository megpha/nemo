// Generated by IB v0.2.7 gem. Do not edit it manually
// Run `rake ib:open` to refresh

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface Camera





-(IBAction) imagePickerControllerDidCancel:(id) picker;
-(IBAction) picker;
-(IBAction) dismiss;
-(IBAction) camera_device;
-(IBAction) media_type_to_symbol:(id) media_type;
-(IBAction) symbol_to_media_type:(id) symbol;
-(IBAction) error:(id) type;
-(IBAction) load_constants_hack;

@end


@interface ParserError: StandardError







@end


@interface NSNotificationCenter





-(IBAction) observers;
-(IBAction) unobserve:(id) observer;

@end


@interface NSURLRequest





-(IBAction) to_s;

@end


@interface UIView





-(IBAction) handle_gesture:(id) recognizer;

@end


@interface UIViewController





-(IBAction) content_frame;

@end


@interface Response





-(IBAction) update:(id) values;
-(IBAction) to_s;
-(IBAction) update_status_description;

@end


@interface Query





-(IBAction) to_s;
-(IBAction) connectionDidFinishLoading:(id) connection;
-(IBAction) create_request;
-(IBAction) set_content_type;
-(IBAction) create_request_body;
-(IBAction) append_payload:(id) body;
-(IBAction) append_form_params:(id) body;
-(IBAction) append_files:(id) body;
-(IBAction) append_body_boundary:(id) body;
-(IBAction) create_url:(id) url_string;
-(IBAction) validate_url:(id) url;
-(IBAction) escape:(id) string;
-(IBAction) convert_payload_to_url;
-(IBAction) log:(id) message;
-(IBAction) escape_line_feeds:(id) hash;
-(IBAction) patch_nsurl_request:(id) request;
-(IBAction) call_delegator_with_response;

@end


@interface InvalidURLError: StandardError







@end


@interface PeriodicTimer





-(IBAction) cancel;

@end


@interface Queue





-(IBAction) initialize;
-(IBAction) size;

@end


@interface Timer





-(IBAction) cancel;

@end


@interface RSSParser





-(IBAction) initialize;
-(IBAction) to_hash;

@end


@interface RSSItem





-(IBAction) initialize;
-(IBAction) to_hash;
-(IBAction) parserDidStartDocument:(id) parser;
-(IBAction) parserDidEndDocument:(id) parser;
-(IBAction) parserError;

@end


@interface InvalidPlayerType: StandardError







@end


@interface NilPlayerCallback: StandardError







@end


@interface Player





-(IBAction) stop;
-(IBAction) media_player;
-(IBAction) set_player_options:(id) options;

@end


@interface ProductViewCell: UITableViewCell

@property IBOutlet UILabel * name;
@property IBOutlet UILabel * info;
@property IBOutlet UILabel * price;
@property IBOutlet UIImageView * picture;



-(IBAction) setup:(id) product;
-(IBAction) next_image;
-(IBAction) refresh_image;

@end


@interface ProductViewController: UIViewController

@property IBOutlet UILabel * name;



-(IBAction) viewDidLoad;

@end


@interface ProductsViewController: UITableViewController





-(IBAction) viewDidLoad;
-(IBAction) viewWillAppear:(id) animated;

@end


@interface Backend





-(IBAction) initialize;
-(IBAction) debug_restkit;
-(IBAction) product_mapping;
-(IBAction) inverse_product_mapping;

@end


