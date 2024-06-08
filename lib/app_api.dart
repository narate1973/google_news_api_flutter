import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:google_new_api_test/responses/responses.dart';

final appApiProvider = Provider<AppApi>((ref) {
  return _AppApiImpl();
});

abstract class AppApi {
  Future<ArticleResponse> getNews({required String category});
}

class _AppApiImpl implements AppApi {
  @override
  Future<ArticleResponse> getNews({required String category}) async {
    // final uri = Uri.https('google-news13.p.rapidapi.com', '/${category.toLowerCase()}', {'lr': 'en-US'});
    // final request = http.Request('GET', uri);
    // request.headers.addAll({
    //   'User-Agent': 'Mozilla/5.1',
    //   'x-rapidapi-host': 'google-news13.p.rapidapi.com',
    //   'x-rapidapi-key': '41879b31edmsh4d4bb5bf45cbc43p15f49ejsn45968247a339',
    // });
    // final response = await request.send();
    return ArticleResponse.fromJson(test);
    // return _handleResponse(response).then(articleResponseFromJson);
  }

  Future<String> _handleResponse(http.StreamedResponse response) async {
    final data = await response.stream.bytesToString();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else if (response.statusCode >= 300 && response.statusCode < 400) {
      throw HttpException(
        data,
        uri: response.request?.url,
      );
    } else {
      throw HttpException(
        data,
        uri: response.request?.url,
      );
    }
  }
}


const test = {
  "status": "success",
  "items": [
    {
      "title": "ECB cuts interest rates as inflation fight reaches a turning point",
      "snippet": "The European Central Bank on Thursday cut interest rates for the first time in five years, a sign of significant progress in the global fight to subdue the ...",
      "publisher": "The Washington Post",
      "timestamp": "1717686960000",
      "newsUrl": "https://www.washingtonpost.com/business/2024/06/06/european-central-bank-interest-rates-cut/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNXdiWEpOYjA1ZlZsVmtUR3g2VFJEZ0F4aUFCU2dLTWdNWlVRNA=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNXdiWEpOYjA1ZlZsVmtUR3g2VFJEZ0F4aUFCU2dLTWdNWlVRNA"
      },
      "hasSubnews": false
    },
    {
      "title": "Nvidia stock pulls back after topping 3 trillion market cap mark",
      "snippet": "Nvidia stock (NVDA) retreated in early trading on Thursday, after a rip-roaring rally sent the company past a 3 trillion market cap for the first time.",
      "publisher": "Yahoo Finance",
      "timestamp": "1717685080000",
      "newsUrl": "https://finance.yahoo.com/news/nvidia-stock-pulls-back-after-topping-3-trillion-market-cap-mark-141014695.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVhlSE5VVXpWS1l6Vm1aeTA1VFJDM0FSaVRBaWdCTWdhQlVaak5uUWs=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVhlSE5VVXpWS1l6Vm1aeTA1VFJDM0FSaVRBaWdCTWdhQlVaak5uUWs"
      },
      "hasSubnews": true,
      "subnews": [
        {
          "title": "Nvidia surpasses Apple to become the second-largest public company in the US",
          "snippet": "Nvidia, Wall Street's favorite artificial intelligence darling, is continuing to swell to staggering heights. The AI chipmaker's market capitalization rose ...",
          "publisher": "CNN",
          "timestamp": "1717629870000",
          "newsUrl": "https://www.cnn.com/2024/06/05/investing/nvidia-stock-apple-microsoft-market-value/index.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVRNVmxIVkU0M2EyaFBSVmRJVFJDZkF4amlCU2dLTWdhWk00WnRIUWc=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVRNVmxIVkU0M2EyaFBSVmRJVFJDZkF4amlCU2dLTWdhWk00WnRIUWc"
          }
        },
        {
          "title": "What's Going On With Nvidia Stock On Thursday?",
          "snippet": "Nvidia Corp's (NASDAQ:NVDA) stock surged to record highs on Wednesday, valuing the company at over 3 trillion and making it the world's second most ...",
          "publisher": "Yahoo Finance",
          "timestamp": "1717683272000",
          "newsUrl": "https://finance.yahoo.com/news/whats-going-nvidia-stock-thursday-141432389.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVZOSGRWZG5wVFJ6SnhNbTlIVFJEb0FoaUFCU2dLTWdhbGxKS3RzUVk=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVZOSGRWZG5wVFJ6SnhNbTlIVFJEb0FoaUFCU2dLTWdhbGxKS3RzUVk"
          }
        },
        {
          "title": "Nvidia's stock market value surpasses 3 trillion. How it rose to AI prominence, by the numbers",
          "snippet": "Nvidia's stock price has more than doubled this year after more than tripling in 2023 and it's now the third most valuable company in the S&P 500.",
          "publisher": "The Associated Press",
          "timestamp": "1717619880000",
          "newsUrl": "https://apnews.com/article/nvidia-artificial-intelligence-stock-market-nasdaq-b1e79cf391f212a4714433afd140e341",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVFiVFoxVDJGRVlrUmlVVGhQVFJEVkFSakFBaWdLTWdhVlE0U3JuUWc=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVFiVFoxVDJGRVlrUmlVVGhQVFJEVkFSakFBaWdLTWdhVlE0U3JuUWc"
          }
        },
        {
          "title": "Nvidia Is Destined to Be the World's Most Valuable Company",
          "snippet": "The chipmaker has surpassed Apple on its way to entering the 3 trillion market cap club.",
          "publisher": "Inc.",
          "timestamp": "1717681376000",
          "newsUrl": "https://www.inc.com/phil-rosen/nvidia-stock-outlook-investors-markets-jensen-huang-tech-ai-rally.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNW9kbEpoVlRRdFNuaEJjVmRLVFJEU0FoallCQ2dLTWdZZFZKQ05JUWM=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNW9kbEpoVlRRdFNuaEJjVmRLVFJEU0FoallCQ2dLTWdZZFZKQ05JUWM"
          }
        },
        {
          "title": "Nvidia passes Apple in market cap as second-most valuable public U.S. company",
          "snippet": "Investors are becoming more comfortable that Nvidia's huge growth in sales to a handful of cloud companies can persist.",
          "publisher": "CNBC",
          "timestamp": "1717614849000",
          "newsUrl": "https://www.cnbc.com/2024/06/05/nvidia-passes-apple-in-market-cap.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNW5Nekl6U0ZwSlpHaFZhMmxPVFJDZkF4ampCU2dLTWdZWlJZcXZJUWs=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNW5Nekl6U0ZwSlpHaFZhMmxPVFJDZkF4ampCU2dLTWdZWlJZcXZJUWs"
          }
        },
        {
          "title": "Nvidia is now more valuable than Apple at 3.01 trillion",
          "snippet": "Nvidia surpassed Apple as the second most valuable company, behind only Microsoft, with a market capitalization of over 3 trillion.",
          "publisher": "The Verge",
          "timestamp": "1717620798000",
          "newsUrl": "https://www.theverge.com/2024/6/5/24172363/nvidia-apple-market-cap-valuation-trillion-ai",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNWlhRTFhWlRrM2NHVmhibEpMVFJDcUJCaXFCQ2dLTWdhTllvWUxyZ1E=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNWlhRTFhWlRrM2NHVmhibEpMVFJDcUJCaXFCQ2dLTWdhTllvWUxyZ1E"
          }
        }
      ]
    },
    {
      "title": "Craft cocktails, mountain bikes and art: Walmart's hometown is booming, and getting more expensive",
      "snippet": "As Walmart gets into new businesses like advertising and tries to lure workers, its hometown of Bentonville, Arkansas, and its corporate offices are ...",
      "publisher": "CNBC",
      "timestamp": "1717671601000",
      "newsUrl": "https://www.cnbc.com/2024/06/06/walmart-hometown-bentonville-arkansas-gets-more-expensive.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVRZWFEwYmxSRlEyUnhlRE50VFJDZkF4ampCU2dLTWdhTkE1Sm9rUW8=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVRZWFEwYmxSRlEyUnhlRE50VFJDZkF4ampCU2dLTWdhTkE1Sm9rUW8"
      },
      "hasSubnews": true,
      "subnews": [
        {
          "title": "Walmart's New Bentonville HQ Has Rooftop Bar and Pickleball",
          "snippet": "Hi, this is Jaewon Kang. Welcome to the weekly Work Shift newsletter. We want to hear from you. Send me your thoughts on today's topic and any other aspects ...",
          "publisher": "Bloomberg",
          "timestamp": "1717505971000",
          "newsUrl": "https://www.bloomberg.com/news/newsletters/2024-06-04/walmart-s-new-bentonville-hq-has-rooftop-bar-and-pickleball",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNUZielJwVG5oc2FsUnNhRzFuVFJDbEF4allCU2dLTWdNQmtBSQ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNUZielJwVG5oc2FsUnNhRzFuVFJDbEF4allCU2dLTWdNQmtBSQ"
          }
        },
        {
          "title": "Wright’s Barbecue to open location at new Walmart campus",
          "snippet": "Walmart's new home office is still under construction, but certain facilities have already opened, including a children's daycare center and a fitness ...",
          "publisher": "KFSM 5Newsonline",
          "timestamp": "1717438800000",
          "newsUrl": "https://www.5newsonline.com/article/money/business/walmarts-new-350-acre-home-office-campus-wrights-barbecue/527-b06e6337-5265-4dbc-8c40-03da5f8c7b1f",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUZhR041UVhGVWVucEplRXBoVFJDZkF4ampCU2dLTWdZQnNaTFF2QVU=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUZhR041UVhGVWVucEplRXBoVFJDZkF4ampCU2dLTWdZQnNaTFF2QVU"
          }
        },
        {
          "title": "Wright's Barbecue to Expand to Walmart Campus",
          "snippet": "Jordan Wright didn't hesitate to take up the chance to bring his barbecue franchise to Walmart Inc. of Bentonville. Wright founded Wright's Barbecue in a ...",
          "publisher": "Arkansas Business",
          "timestamp": "1717390835000",
          "newsUrl": "https://www.arkansasbusiness.com/article/wrights-barbecue-expands-to-walmart-campus/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNTROVXRoUkc0NU16VlVha2N3VFJERUF4aW1CU2dLTWdNQjRBZw=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNTROVXRoUkc0NU16VlVha2N3VFJERUF4aW1CU2dLTWdNQjRBZw"
          }
        },
        {
          "title": "Work on Walmart Inc.’s new Bentonville HQ nearing the finish line",
          "snippet": "BENTONVILLE -- Walmart Inc.'s new headquarters will be ready for workers to start moving in around the first of the year.",
          "publisher": "Northwest Arkansas Democrat-Gazette",
          "timestamp": "1717632840000",
          "newsUrl": "https://www.nwaonline.com/news/2024/jun/05/work-on-walmart-incs-new-bentonville-hq-nearing/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNVFXRnBPWjNwM2FqWlZZV3RyVFJDM0FSaVRBaWdCTWdNQllCUQ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNVFXRnBPWjNwM2FqWlZZV3RyVFJDM0FSaVRBaWdCTWdNQllCUQ"
          }
        },
        {
          "title": "How Walmart turned Bentonville, Arkansas into a boomtown",
          "snippet": "Walmart's hometown of Bentonville, Arkansas has become a boomtown with many amenities you might expect to find in New York or San Francisco – fancy ...",
          "publisher": "CNBC",
          "timestamp": "1717675192000",
          "newsUrl": "https://www.cnbc.com/video/2024/06/06/how-walmart-turned-bentonville-arkansas-into-a-boomtown.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNURabE5pVWs5NFNqQnhlWFJXVFJDZkF4amlCU2dLTWdZQmtZeU95UVU=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNURabE5pVWs5NFNqQnhlWFJXVFJDZkF4amlCU2dLTWdZQmtZeU95UVU"
          }
        },
        {
          "title": "Work on Walmart Inc.'s new Bentonville HQ nearing the finish line | Arkansas Democrat Gazette",
          "snippet": "BENTONVILLE -- Walmart Inc.'s new headquarters will be ready for workers to start moving in around the first of the year.",
          "publisher": "Arkansas Online",
          "timestamp": "1717632840000",
          "newsUrl": "https://www.arkansasonline.com/news/2024/jun/05/work-on-walmart-incs-new-bentonville-hq-nearing/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNVFXRnBPWjNwM2FqWlZZV3RyVFJDM0FSaVRBaWdCTWdNQllCUQ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNVFXRnBPWjNwM2FqWlZZV3RyVFJDM0FSaVRBaWdCTWdNQllCUQ"
          }
        }
      ]
    },
    {
      "title": "Rivian redesigns all-electric R1 pickup and SUV, adds Nvidia chips and improves performance",
      "snippet": "Rivian Automotive has redesigned its all-electric R1 pickup and SUV models to improve range, performance and computing power using Nvidia chips.",
      "publisher": "CNBC",
      "timestamp": "1717689601000",
      "newsUrl": "https://www.cnbc.com/2024/06/06/rivian-r1-pickup-suv-redesigned.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNWZhVmwyVWtaYU9HTnBYekJOVFJDZkF4ampCU2dLTWdZZFVaWXZyUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNWZhVmwyVWtaYU9HTnBYekJOVFJDZkF4ampCU2dLTWdZZFVaWXZyUWc"
      },
      "hasSubnews": true,
      "subnews": [
        {
          "title": "Rivian's R1 vehicles are getting a gut overhaul — here's what's new",
          "snippet": "Rivian is reengineering the guts of its R1T and R1S vehicles, removing wiring, replacing motors, and updating its battery tech. It's a total overhaul for ...",
          "publisher": "The Verge",
          "timestamp": "1717689600000",
          "newsUrl": "https://www.theverge.com/2024/6/6/24172761/rivian-r1t-r1s-refresh-update-motor-battery-price",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVlWRzFaUVRSYVEyWnlhemgzVFJDZkF4amlCU2dLTWdhRjBJcW14QVE=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVlWRzFaUVRSYVEyWnlhemgzVFJDZkF4amlCU2dLTWdhRjBJcW14QVE"
          }
        },
        {
          "title": "Rivian's revamped R1 electric pickup and SUV, tested on- and off-road",
          "snippet": "In rainy Seattle this week, Rivian unveiled what it's calling the \"Second Generation\" of its R1 line with a suite of mostly under-the-hood software and ...",
          "publisher": "Ars Technica",
          "timestamp": "1717689618000",
          "newsUrl": "https://arstechnica.com/cars/2024/06/rivians-revamped-r1-electric-pickup-and-suv-tested-on-and-off-road/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNWhTM0V4U1d4WlpWbHBibTkyVFJDQUJCaldCQ2dLTWdNRjBCQQ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNWhTM0V4U1d4WlpWbHBibTkyVFJDQUJCaldCQ2dLTWdNRjBCQQ"
          }
        },
        {
          "title": "Rivian's Next-Gen EVs Are Now Here. I Went Inside the Labs Where They Came Together",
          "snippet": "I'm in the driver's seat of the coolest car I've ever been in, but even though there's a steering wheel, it doesn't drive. There's no motor or exterior ...",
          "publisher": "CNET",
          "timestamp": "1717689600000",
          "newsUrl": "https://www.cnet.com/roadshow/news/rivians-next-gen-evs-are-now-here-i-went-inside-the-labs-where-they-came-together/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iMkNnNDJObXAxYkdSWlRFeENjaTFNVFJEZ0F4aUFCU2dLTWdzQkFKQ3hIR2xpem9rZ2t3=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iMkNnNDJObXAxYkdSWlRFeENjaTFNVFJEZ0F4aUFCU2dLTWdzQkFKQ3hIR2xpem9rZ2t3"
          }
        },
        {
          "title": "Rivian's second-gen R1 brings new utility, bold graphics and a richly designed interior",
          "snippet": "Californian EV maker Rivian has updated its flagship R1 SUV and pick-up, We take a first look.",
          "publisher": "Wallpaper*",
          "timestamp": "1717678800000",
          "newsUrl": "https://www.wallpaper.com/transportation/rivians-second-gen-r1-brings-new-utility-bold-graphics-and-a-richly-designed-interior",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXdSQzFMWW0xa1JVUktlRVZwVFJDVkFoaWZBeWdLTWdaRmdJNlZOQVk=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXdSQzFMWW0xa1JVUktlRVZwVFJDVkFoaWZBeWdLTWdaRmdJNlZOQVk"
          }
        },
        {
          "title": "Rivian overhauled the R1S and R1T to entice new buyers ahead of cheaper R2 launch",
          "snippet": "Rivian has changed 600 parts on its R1S SUV and R1T pickup truck in a bid to drive down manufacturing costs, while improving performance of its flagship ...",
          "publisher": "TechCrunch",
          "timestamp": "1717689615000",
          "newsUrl": "https://techcrunch.com/2024/06/06/rivian-refresh-r1t-r1s-second-generation-speed-range-apple/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNU9hRU5NZG0xQ1QxaEVlVUV6VFJERUF4aW1CU2dLTWdZaGRaTHNNUWM=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNU9hRU5NZG0xQ1QxaEVlVUV6VFJERUF4aW1CU2dLTWdZaGRaTHNNUWM"
          }
        },
        {
          "title": "2025 Rivian R1T Concentrates on Inner Beauty",
          "snippet": "The truck you see here is what Rivian is calling its second-generation R1T. Your eyes do not deceive you; it looks much like the model that launched for ...",
          "publisher": "Car and Driver",
          "timestamp": "1717689749000",
          "newsUrl": "https://www.caranddriver.com/reviews/a60995247/2025-rivian-r1t-drive/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXliall6YVdKMGJHZDNaMmR0VFJDZkF4ampCU2dLTWdZSjA0eXBSUVU=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXliall6YVdKMGJHZDNaMmR0VFJDZkF4ampCU2dLTWdZSjA0eXBSUVU"
          }
        }
      ]
    },
    {
      "title": "First-Quarter US Labor Costs Marked Down on Weaker Output, Hours",
      "snippet": "US labor costs increased in the first quarter by less than previously reported, reflecting downward revisions to economic output and hours worked and ...",
      "publisher": "Bloomberg",
      "timestamp": "1717677276000",
      "newsUrl": "https://www.bloomberg.com/news/articles/2024-06-06/first-quarter-us-labor-costs-marked-down-on-weaker-output-hours",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVhaME5UYkUxc1JUSm1abHBLVFJERUF4aW1CU2dLTWdhaFVZcnlRQVU=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVhaME5UYkUxc1JUSm1abHBLVFJERUF4aW1CU2dLTWdhaFVZcnlRQVU"
      },
      "hasSubnews": true,
      "subnews": [
        {
          "title": "U.S. productivity in first quarter gain lowered to 0.2%",
          "snippet": "Story developing. Stay tuned for updates here. The numbers: The productivity of American workers rose by a revised 0.2% annual rate in the first quarter, ...",
          "publisher": "MarketWatch",
          "timestamp": "1717677360000",
          "newsUrl": "https://www.marketwatch.com/story/u-s-productivity-in-first-quarter-gain-lowered-to-0-2-90953c26",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNHhOWHBFY21OS2JUbGlkMmsyVFJDcUJCaXFCQ2dLTWdZQmxvcWdyd2c=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNHhOWHBFY21OS2JUbGlkMmsyVFJDcUJCaXFCQ2dLTWdZQmxvcWdyd2c"
          }
        },
        {
          "title": "US Worker Productivity Slows While Labor Costs Climb",
          "snippet": "Surprising economic shifts challenge Federal Reserve's rate cut plans.",
          "publisher": "Finimize",
          "timestamp": "1717680605000",
          "newsUrl": "https://finimize.com/content/us-worker-productivity-slows-while-labor-costs-climb",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNDRNMDVDWmpobmFIcHVNakZWVFJDcUFSaXBBaWdCTWdZZFE0Wk9yUVE=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNDRNMDVDWmpobmFIcHVNakZWVFJDcUFSaXBBaWdCTWdZZFE0Wk9yUVE"
          }
        },
        {
          "title": "Labor Productivity Rose 0.2% in Q1 2024",
          "snippet": "Washington, DC, June 6, 2024—Nonfarm business sector labor productivity increased 0.2% in Q1 2024, the U.S. Bureau of Labor Statistics reported, ...",
          "publisher": "Floor Focus",
          "timestamp": "1717683360000",
          "newsUrl": "https://www.floordaily.net/flooring-news/labor-productivity-rose-02-in-q1-2024",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNHdWbEJNWjNaMFprZFRSRFZ5VFJDOEFSajZBU2dCTWdZcFZZck9LUVU=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNHdWbEJNWjNaMFprZFRSRFZ5VFJDOEFSajZBU2dCTWdZcFZZck9LUVU"
          }
        },
        {
          "title": "U.S. Labor Productivity, Costs Increase Less Than Previously Estimated In Q1",
          "snippet": "Revised data released by the Labor Department on Thursday showed U.S. labor productivity increased by slightly less than previously estimated in the first ...",
          "publisher": "RTTNews",
          "timestamp": "1717682100000",
          "newsUrl": "https://www.rttnews.com/3452871/u-s-labor-productivity-costs-increase-less-than-previously-estimated-in-q1.aspx",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVNjbkZMYldaV1gxTjFlSGx6VFJDLUFSaUtBaWdCTWdZSkFvd3BtUWM=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVNjbkZMYldaV1gxTjFlSGx6VFJDLUFSaUtBaWdCTWdZSkFvd3BtUWM"
          }
        },
        {
          "title": "USA: productivity revised downwards slightly in Q1",
          "snippet": "Non-farm productivity in the USA rose by an annualized 0.2% in the first quarter of 2024, according to the second estimate from the Labor Department, ...",
          "publisher": "Marketscreener.com",
          "timestamp": "1717677575000",
          "newsUrl": "https://www.marketscreener.com/quote/index/DOW-JONES-INDUSTRIAL-4945/news/USA-productivity-revised-downwards-slightly-in-Q1-46920058/",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNXVSekoyZFhsSVRFZFpSVXR1VFJDc0FoakJBeWdLTWdrQlFJNFFzV1d3Q2dJ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNXVSekoyZFhsSVRFZFpSVXR1VFJDc0FoakJBeWdLTWdrQlFJNFFzV1d3Q2dJ"
          }
        },
        {
          "title": "US Productivity Growth Slowed in Early 2024",
          "snippet": "(Reuters) - U.S. worker productivity grew slightly less than previously estimated in the first quarter but exceeded market expectations, and unit labor ...",
          "publisher": "U.S News & World Report Money",
          "timestamp": "1717678200000",
          "newsUrl": "https://money.usnews.com/investing/news/articles/2024-06-06/us-productivity-growth-slowed-in-early-2024",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUdTMXAwUlhOdVdrdFhiVmxDVFJDa0F4aUFCU2dLTWdZQk1vcU9NUVU=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUdTMXAwUlhOdVdrdFhiVmxDVFJDa0F4aUFCU2dLTWdZQk1vcU9NUVU"
          }
        }
      ]
    },
    {
      "title": "He taught at MIT, worked at Morgan Stanley, and convinced Bill Ackman and Galaxy to back his 200 million crypto fund by his early 30s. His future is now in jeopardy",
      "snippet": "How Shima Capital's fast-and-loose approach to compliance alienated its backers and could run afoul of the SEC.",
      "publisher": "Fortune",
      "timestamp": "1717689586000",
      "newsUrl": "https://fortune.com/crypto/2024/06/06/shima-capital-vc-ackman-galaxy-yida-gao/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUpXaTFZVVRkTVVtRjBSbll6VFJERUF4aW1CU2dLTWdhcFZaYk5KUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUpXaTFZVVRkTVVtRjBSbll6VFJERUF4aW1CU2dLTWdhcFZaYk5KUWc"
      },
      "hasSubnews": false
    },
    {
      "title": "Microsoft, OpenAI and Nvidia investigated over possible breach of antitrust laws",
      "snippet": "Microsoft, OpenAI and Nvidia face increased antitrust scrutiny of their roles in the artificial intelligence industry after a report that US regulators have ...",
      "publisher": "The Guardian",
      "timestamp": "1717689600000",
      "newsUrl": "https://www.theguardian.com/business/article/2024/jun/06/microsoft-openai-and-nvidia-investigated-over-possible-breach-of-antitrust-laws",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iMkNnNW5jVzVuYjJsNFdqWnpMV3h1VFJDUkF4ajhCU2dLTWdzQmtJaGd2S1VOTFZwUFJR=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iMkNnNW5jVzVuYjJsNFdqWnpMV3h1VFJDUkF4ajhCU2dLTWdzQmtJaGd2S1VOTFZwUFJR"
      },
      "hasSubnews": true,
      "subnews": [
        {
          "title": "U.S. Clears Way for Antitrust Inquiries of Nvidia, Microsoft and OpenAI",
          "snippet": "Federal regulators have reached a deal that allows them to proceed with antitrust investigations into the dominant roles that Microsoft, OpenAI and Nvidia ...",
          "publisher": "The New York Times",
          "timestamp": "1717656120000",
          "newsUrl": "https://www.nytimes.com/2024/06/05/technology/nvidia-microsoft-openai-antitrust-doj-ftc.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNW5TVlZLWTI1TU4xZGxiV28xVFJEQ0F4allCQ2dLTWdrQlFKQWdxNmR6U2dJ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNW5TVlZLWTI1TU4xZGxiV28xVFJEQ0F4allCQ2dLTWdrQlFKQWdxNmR6U2dJ"
          }
        },
        {
          "title": "As AI booms, Microsoft’s deal with a startup comes under federal investigation",
          "snippet": "The Federal Trade Commission is investigating a recent Microsoft deal with artificial intelligence startup Inflection, according to a person familiar with ...",
          "publisher": "CNN",
          "timestamp": "1717686675000",
          "newsUrl": "https://www.cnn.com/2024/06/06/tech/ftc-microsofts-ai-investigation/index.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUhaa1ZJYTE5c1EyUnZUMUZ2VFJDZkF4amlCU2dLTWdZQllJNEZ1UVk=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUhaa1ZJYTE5c1EyUnZUMUZ2VFJDZkF4amlCU2dLTWdZQllJNEZ1UVk"
          }
        },
        {
          "title": "Exclusive | FTC Opens Antitrust Probe of Microsoft AI Deal",
          "snippet": "Commission has sent subpoenas to tech giant and startup, asking whether their partnership evaded required government review.",
          "publisher": "The Wall Street Journal",
          "timestamp": "1717681440000",
          "newsUrl": "https://www.wsj.com/tech/ai/ftc-opens-antitrust-probe-of-microsoft-ai-deal-29b5169a",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNDJkVEpxTlVwclRtbzRiR1Y2VFJERUF4aW5CU2dLTWdZWk5JekxvUWM=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNDJkVEpxTlVwclRtbzRiR1Y2VFJERUF4aW5CU2dLTWdZWk5JekxvUWM"
          }
        },
        {
          "title": "'Strong likelihood' ECB is in dialling back phase, says Lagarde, after first rate cut since 2019 – as it happened",
          "snippet": "European Central Bank lowers borrowing costs for first time in almost five years, but won't pre-commit to further cuts.",
          "publisher": "The Guardian",
          "timestamp": "1717655460000",
          "newsUrl": "https://www.theguardian.com/business/live/2024/jun/06/us-antitrust-inquiries-nvidia-microsoft-openai-ecb-interest-rate-cut-business-live",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNDRUVEk0Y25CeWJUSjBiMDVZVFJDWEFoalJBeWdLTWdZZEo1cEttZ2s=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNDRUVEk0Y25CeWJUSjBiMDVZVFJDWEFoalJBeWdLTWdZZEo1cEttZ2s"
          }
        },
        {
          "title": "U.S. regulators to open antitrust probes into Nvidia, Microsoft and OpenAI",
          "snippet": "Federal regulators will proceed with antitrust investigations focusing on Microsoft, OpenAI and Nvidia, according to a source familiar with the situation.",
          "publisher": "CNBC",
          "timestamp": "1717682020000",
          "newsUrl": "https://www.cnbc.com/2024/06/06/us-regulators-to-open-antitrust-probes-into-nvidia-microsoft-and-openai.html",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNTBiM0JQTFhCM1ZsbFFkMFp0VFJDZkF4ampCU2dLTWdrRlFaUzNJR25CS0FJ=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNTBiM0JQTFhCM1ZsbFFkMFp0VFJDZkF4ampCU2dLTWdrRlFaUzNJR25CS0FJ"
          }
        },
        {
          "title": "US Probes Microsoft's Deal With AI Firm Inflection, WSJ Says",
          "snippet": "US regulators are investigating whether a deal Microsoft Corp. struck with AI startup Inflection may have been structured to avoid scrutiny, the Wall Street ...",
          "publisher": "Bloomberg",
          "timestamp": "1717650000000",
          "newsUrl": "https://www.bloomberg.com/news/articles/2024-06-06/us-ftc-probes-microsoft-deal-with-ai-firm-inflection-wsj-says",
          "images": {
            "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXlNVWhFY1haeFRWbDBlakZ4VFJERUF4aW1CU2dLTWdZQmNKaTNLQWc=-w280-h168-p-df-rw",
            "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXlNVWhFY1haeFRWbDBlakZ4VFJERUF4aW1CU2dLTWdZQmNKaTNLQWc"
          }
        }
      ]
    },
    {
      "title": "CDC Says Cucumbers Likely Cause of Salmonella Outbreak in 25 States",
      "snippet": "Cucumbers grown in Florida and distributed across the country have been identified as the likely cause of a Salmonella outbreak in at least 25 states, ...",
      "publisher": "Gizmodo",
      "timestamp": "1717678800000",
      "newsUrl": "https://gizmodo.com/cdc-cucumbers-salmonella-outbreak-pa-ny-fl-25-states-1851522201",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVliVUZFYlhKTGNsTndUMnQzVFJDMEFSakFBaWdLTWdhSkVaQW1HUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVliVUZFYlhKTGNsTndUMnQzVFJDMEFSakFBaWdLTWdhSkVaQW1HUWc"
      },
      "hasSubnews": false
    },
    {
      "title": "Oil prices gain for second day as ECB cuts rates, traders hope for Fed to ease in September",
      "snippet": "Oil prices closed more than 1% higher Wednesday, snapping a losing streak triggered by the OPEC+ decision to increase supply.",
      "publisher": "CNBC",
      "timestamp": "1717678389000",
      "newsUrl": "https://www.cnbc.com/2024/06/06/crude-oil-prices-today.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVlNVzlTVkdsTFFXRlFZMFpaVFJDZkF4ampCU2dLTWdZZFZJN05vUWM=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVlNVzlTVkdsTFFXRlFZMFpaVFJDZkF4ampCU2dLTWdZZFZJN05vUWM"
      },
      "hasSubnews": false
    },
    {
      "title": "Mortgage Rates Rise, Over 7% since Early April, Buyers Remain on Strike, Housing Market Still Frozen as Prices Are Too High",
      "snippet": "Stuck with a 6% or 7% mortgage that was supposed to be refinanced? The Fed is counting on them to help bring inflation down. By Wolf Richter for WOLF STREET ...",
      "publisher": "WOLF STREET",
      "timestamp": "1717655207000",
      "newsUrl": "https://wolfstreet.com/2024/06/05/mortgage-rates-rise-further-over-7-since-early-april-buyers-remain-on-strike-housing-market-still-frozen-as-prices-are-too-high/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVpZVTkxZGw5TVVrc3pPRmh6VFJEaEF4ajlCQ2dLTWdZQkFKQjNtQW8=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVpZVTkxZGw5TVVrc3pPRmh6VFJEaEF4ajlCQ2dLTWdZQkFKQjNtQW8"
      },
      "hasSubnews": false
    },
    {
      "title": "National Donut Day 2024 deals: Get free food at Dunkin', Krispy Kreme, Duck Donuts, Sheetz",
      "snippet": "Friday is National Donut Day and you can get free treats at Dunkin', Duck Donuts, Krispy Kreme and Casey's convenience stores.",
      "publisher": "USA TODAY",
      "timestamp": "1717668783000",
      "newsUrl": "https://www.usatoday.com/story/money/food/2024/06/06/national-donut-day-2024-deals/73970392007/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNHllalZuWTJ4S2RFaFFaakF4VFJDZUFoajhBeWdLTWdZUkk0aXNwUVk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNHllalZuWTJ4S2RFaFFaakF4VFJDZUFoajhBeWdLTWdZUkk0aXNwUVk"
      },
      "hasSubnews": false
    },
    {
      "title": "Retail company in California using body-worn cameras to deter shoplifters",
      "snippet": "A surge in flash mob robberies and shoplifting at retail stores across Southern California has some companies getting creative with security, ...",
      "publisher": "KTLA Los Angeles",
      "timestamp": "1717651689000",
      "newsUrl": "https://ktla.com/news/california/retail-company-in-california-using-body-worn-cameras-to-deter-shoplifters/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXhOVkpFTjBwbVJFOVVOVWhvVFJDZEF4am5CU2dLTWdZQlFJaHZNUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXhOVkpFTjBwbVJFOVVOVWhvVFJDZEF4am5CU2dLTWdZQlFJaHZNUWc"
      },
      "hasSubnews": false
    },
    {
      "title": "Robinhood acquires global crypto exchange Bitstamp for 200M",
      "snippet": "Stock-trading app Robinhood is diving deeper into the cryptocurrency realm with the acquisition of crypto exchange Bitstamp.",
      "publisher": "TechCrunch",
      "timestamp": "1717677984000",
      "newsUrl": "https://techcrunch.com/2024/06/06/robinhood-acquires-global-crypto-exchange-bitstamp-for-200m/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNTRiazFVVFhsalEwVlRTR2xaVFJDZkF4ampCU2dLTWdZQmNJNnNPUVU=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNTRiazFVVFhsalEwVlRTR2xaVFJDZkF4ampCU2dLTWdZQmNJNnNPUVU"
      },
      "hasSubnews": false
    },
    {
      "title": "AI Momentum Fuels HPE's Return To Revenue Growth But Profitability Has Yet To Enter The Picture",
      "snippet": "On Tuesday, Hewlett Packard Enterprise (NYSE: HPE) reported its fiscal second quarter results that surpassed estimates as its server business got a helping ...",
      "publisher": "Yahoo Finance",
      "timestamp": "1717676512000",
      "newsUrl": "https://finance.yahoo.com/news/ai-momentum-fuels-hpes-return-122152404.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNTNhMHRSTUdsbmJHOTVNMWx0VFJEb0FoaUFCU2dLTWdhUk00RE5IUW8=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNTNhMHRSTUdsbmJHOTVNMWx0VFJEb0FoaUFCU2dLTWdhUk00RE5IUW8"
      },
      "hasSubnews": false
    },
    {
      "title": "Keith Gill's GameStop Trades Pose Conundrum for Market Cops",
      "snippet": "Lawyers say it is unlikely regulators could bring a case against the meme-stock influencer based on the facts currently known.",
      "publisher": "The Wall Street Journal",
      "timestamp": "1717666200000",
      "newsUrl": "https://www.wsj.com/finance/regulation/keith-gills-gamestop-trades-pose-conundrum-for-market-cops-70cc5301",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXdVR1ZhUnpNNWIwZHRjRm8zVFJERUF4aW5CU2dLTWdZWlU0NHhKUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXdVR1ZhUnpNNWIwZHRjRm8zVFJERUF4aW5CU2dLTWdZWlU0NHhKUWc"
      },
      "hasSubnews": false
    },
    {
      "title": "US appeals court says SEC exceeded authority with fund rule",
      "snippet": "The U.S. Fifth Circuit Appeals Court struck down an SEC hedge fund transparency rule finding the regulator had exceeded its authority.",
      "publisher": "Cointelegraph",
      "timestamp": "1717652723000",
      "newsUrl": "https://cointelegraph.com/news/sec-loses-case-after-exceeding-congressional-authority",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNW1hbTVDVW5weGRHeFRjMUl0VFJERUF4aW5CU2dLTWdhbEk0eXZ0UVk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNW1hbTVDVW5weGRHeFRjMUl0VFJERUF4aW5CU2dLTWdhbEk0eXZ0UVk"
      },
      "hasSubnews": false
    },
    {
      "title": "The 2025 Toyota Crown Signia Has No Idea What It Wants To Be",
      "snippet": "I never quite determined the target audience for the Crown Signia, but I was charmed by the luxury-adjacent SUV nevertheless.",
      "publisher": "Jalopnik",
      "timestamp": "1717671600000",
      "newsUrl": "https://jalopnik.com/the-2025-toyota-crown-signia-has-no-idea-what-it-wants-1851413570",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNVBSa2RTYm5aUVoySlhSVEpVVFJDZkF4ampCU2dLTWdtcGdJRE5NV2NsT3dB=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNVBSa2RTYm5aUVoySlhSVEpVVFJDZkF4ampCU2dLTWdtcGdJRE5NV2NsT3dB"
      },
      "hasSubnews": false
    },
    {
      "title": "NIO Earnings: NIO Falls as Q1 Results Disappoint - TipRanks.com",
      "snippet": "NIO (NYSE:NIO) slid in pre-market trading after the Chinese EV major announced disappointing Q1 results. The company reported Q1 adjusted loss of RMB2.39 ...",
      "publisher": "TipRanks",
      "timestamp": "1717676192000",
      "newsUrl": "https://www.tipranks.com/news/nio-earnings-nio-falls-as-q1-results-disappoint",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNXhabXRqVjIxVVZXZFBlRkZ0VFJDV0F4anVCU2dLTWdrSmNZamxTU00xU3dJ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNXhabXRqVjIxVVZXZFBlRkZ0VFJDV0F4anVCU2dLTWdrSmNZamxTU00xU3dJ"
      },
      "hasSubnews": false
    },
    {
      "title": "A million gallons a day?— Elon Musk's supercomputer plans raise questions about local water supply",
      "snippet": "Supercomputers need ...",
      "publisher": "Action News 5",
      "timestamp": "1717646760000",
      "newsUrl": "https://www.actionnews5.com/2024/06/06/million-gallons-day-elon-musks-supercomputer-plans-raise-questions-about-local-water-supply/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUZPV3hzUkhsaFNXVkhiM0JPVFJDSEF4aVBCaWdLTWdZQm80NVBPUVk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUZPV3hzUkhsaFNXVkhiM0JPVFJDSEF4aVBCaWdLTWdZQm80NVBPUVk"
      },
      "hasSubnews": false
    },
    {
      "title": "Eric Schmidt Hires from Apple, SpaceX and Google For Drone Project",
      "snippet": "After founding the secretive military drone company White Stork last year, the former Google CEO has also begun testing prototypes with the Ukrainian ...",
      "publisher": "Forbes",
      "timestamp": "1717669800000",
      "newsUrl": "https://www.forbes.com/sites/sarahemerson/2024/06/06/eric-schmidt-is-secretly-testing-ai-military-drones-in-a-wealthy-silicon-valley-suburb/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVhYMmd4UW1wQk5HSXljSGR5VFJDcUJCaXFCQ2dLTWdZaGhJNk9NUVk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVhYMmd4UW1wQk5HSXljSGR5VFJDcUJCaXFCQ2dLTWdZaGhJNk9NUVk"
      },
      "hasSubnews": false
    },
    {
      "title": "Biggest analyst calls & stocks to watch Thursday",
      "snippet": "Here are the biggest calls on Wall Street on Thursday.",
      "publisher": "CNBC",
      "timestamp": "1717676756000",
      "newsUrl": "https://www.cnbc.com/2024/06/06/biggest-analyst-calls-stocks-to-watch-thursday.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXJjVWhUYlZCUkxUSkplSFJwVFJDZkF4ampCU2dLTWdZQm9ZelJ3QVU=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXJjVWhUYlZCUkxUSkplSFJwVFJDZkF4ampCU2dLTWdZQm9ZelJ3QVU"
      },
      "hasSubnews": false
    },
    {
      "title": "Bitcoin miners pivot to AI: New revenue stream post-halving?",
      "snippet": "Bitcoin miners seems to have settled on AI to cover revenue shortfalls as post-halving and rewards slash effects become adverse.",
      "publisher": "AMBCrypto News",
      "timestamp": "1717657480000",
      "newsUrl": "https://ambcrypto.com/bitcoin-miners-pivot-to-ai-new-revenue-stream-post-halving/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNVZXVXhhZW1aaWNVNTZjRWx1VFJDdEF4akxCU2dLTWdrQlFJUkdOS1RRVVFF=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNVZXVXhhZW1aaWNVNTZjRWx1VFJDdEF4akxCU2dLTWdrQlFJUkdOS1RRVVFF"
      },
      "hasSubnews": false
    },
    {
      "title": "FDA advisers urge targeting JN.1 strain in recipe for fall's COVID vaccines",
      "snippet": "WASHINGTON (AP) — Government advisers Wednesday said it's time to update the recipe for the COVID-19 vaccines Americans will receive in the fall ...",
      "publisher": "The Associated Press",
      "timestamp": "1717630380000",
      "newsUrl": "https://apnews.com/article/covid-vaccines-updated-moderna-pfizer-novavax-72c2c5fafc46ccc9f2fd89fcda5d99df",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iPkNnNUtXRlpLTmtkeVEyUlRVbmxsVFJDUEF4alhCQ2dLTWhRQkVJSWxwaVpNZDhqY1ZBNXNycGljNlhPdEFR=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iPkNnNUtXRlpLTmtkeVEyUlRVbmxsVFJDUEF4alhCQ2dLTWhRQkVJSWxwaVpNZDhqY1ZBNXNycGljNlhPdEFR"
      },
      "hasSubnews": false
    },
    {
      "title": "AI Risk Levels Being Suppressed, Claims Letter From OpenAI And Google DeepMind Employees",
      "snippet": "The letter claims there is a lot of nonpublic information on AI dangers.",
      "publisher": "Deadline",
      "timestamp": "1717644780000",
      "newsUrl": "https://deadline.com/2024/06/ai-risk-levels-suppressed-claims-letter-openai-google-deepmind-employees-1235960293/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNTZhVU0xUmxwR2VraFBOemR4VFJDZkF4ampCU2dLTWdhbGdvN01zUVk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNTZhVU0xUmxwR2VraFBOemR4VFJDZkF4ampCU2dLTWdhbGdvN01zUVk"
      },
      "hasSubnews": false
    },
    {
      "title": "Winning 552M Mega Millions jackpot ticket sold in Illinois",
      "snippet": "Someone in Illinois has won the Mega Millions jackpot in Tuesday night's drawing.",
      "publisher": "WGN TV Chicago",
      "timestamp": "1717602697000",
      "newsUrl": "https://wgntv.com/news/illinois-lottery/winning-552m-mega-millions-jackpot-ticket-sold-in-illinois/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNWtMVTlyZUhOblZtdGpOa3hmVFJDZkF4ampCU2dLTWdZRlFJeHVOUVk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNWtMVTlyZUhOblZtdGpOa3hmVFJDZkF4ampCU2dLTWdZRlFJeHVOUVk"
      },
      "hasSubnews": false
    },
    {
      "title": "Walmart offers bonus program to about 700,000 hourly US store workers",
      "snippet": "BENTONVILLE, Arkansas (Reuters) -Walmart will pay bonuses to its U.S. hourly store workers, including those at its pharmacy and Vision Center stores, ...",
      "publisher": "Yahoo Finance",
      "timestamp": "1717623584000",
      "newsUrl": "https://finance.yahoo.com/news/walmart-pay-us-hourly-store-132848427.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNW5UM05zYUhCQlVEaENha1ZsVFJERUF4aW5CU2dLTWdZQlE0d2twUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNW5UM05zYUhCQlVEaENha1ZsVFJERUF4aW5CU2dLTWdZQlE0d2twUWc"
      },
      "hasSubnews": false
    },
    {
      "title": "Experts say Red Lobster's shrimp excuse is 'smoke screen' for real problems",
      "snippet": "Industry experts say the Red Lobster all-you-can-eat shrimp deal gone wrong is masking the real issues that led to the company's downfall after over 50 ...",
      "publisher": "Fox Business",
      "timestamp": "1717668000000",
      "newsUrl": "https://www.foxbusiness.com/lifestyle/experts-say-red-lobster-shrimp-excuse-smoke-screen-real-problems",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNVZSR0ZWWXpWeVQwTjRNVlZzVFJDZkF4ampCU2dLTWdtQk1ZTG9HS3BNTFFJ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNVZSR0ZWWXpWeVQwTjRNVlZzVFJDZkF4ampCU2dLTWdtQk1ZTG9HS3BNTFFJ"
      },
      "hasSubnews": false
    },
    {
      "title": "Wall Street mixed as tech stocks retreat; labor data lifts rate cut hopes",
      "snippet": "Technology stocks retreated in choppy trading on Thursday, pressuring the benchmark S&P 500 and the Nasdaq indexes, while the Dow inched up after jobless ...",
      "publisher": "Reuters",
      "timestamp": "1717684260000",
      "newsUrl": "https://www.reuters.com/markets/us/futures-subdued-after-tech-rally-nvidia-continues-climb-2024-06-06/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNVdORFJ6Wm5aelJtSkpXSFJqVFJERUF4aW1CU2dLTWdrQlJaS3VPZWJBaHdJ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNVdORFJ6Wm5aelJtSkpXSFJqVFJERUF4aW1CU2dLTWdrQlJaS3VPZWJBaHdJ"
      },
      "hasSubnews": false
    },
    {
      "title": "Telecom industry groups sue to block Biden's reinstatement of net neutrality rule",
      "snippet": "The FCC's effort to reinstate net neutrality rules under President Biden is facing legal challenges from several groups representing the U.S. ...",
      "publisher": "Fox Business",
      "timestamp": "1717681260000",
      "newsUrl": "https://www.foxbusiness.com/technology/telecom-industry-groups-sue-block-bidens-reinstatement-net-neutrality-rule",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVVhRzQ0WWtneFJFVnhNMk50VFJDZkF4ampCU2dLTWdhZFY1UktwZ2c=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVVhRzQ0WWtneFJFVnhNMk50VFJDZkF4ampCU2dLTWdhZFY1UktwZ2c"
      },
      "hasSubnews": false
    },
    {
      "title": "Financiers plan to launch a Texas-based stock exchange",
      "snippet": "The group announced Wednesday it raised 120 million in capital to start a stock exchange in Dallas this year.",
      "publisher": "The Texas Tribune",
      "timestamp": "1717626749000",
      "newsUrl": "https://www.texastribune.org/2024/06/05/texas-stock-exchange/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iMkNnNXNUa3BQT0hCMlpWbEtOR2RaVFJERkF4aWtCU2dLTWdzQkFJaUJHZWE0RkVsTmF3=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iMkNnNXNUa3BQT0hCMlpWbEtOR2RaVFJERkF4aWtCU2dLTWdzQkFJaUJHZWE0RkVsTmF3"
      },
      "hasSubnews": false
    },
    {
      "title": "Union rejects American Airlines' latest proposal offering 17% wage hikes",
      "snippet": "The Association of Professional Flight Attendants (APFA), which represents over 23000 American flight attendants, said on Wednesday that it unanimously ...",
      "publisher": "Yahoo Finance",
      "timestamp": "1717632900000",
      "newsUrl": "https://finance.yahoo.com/news/american-airlines-offers-immediate-wage-170749466.html",
      "hasSubnews": false
    },
    {
      "title": "Popular bankrupt retailer is reopening after abruptly closing stores",
      "snippet": "The company claims that it is \"starting from scratch\" after its parent company filed for Chapter 7 bankruptcy.",
      "publisher": "TheStreet",
      "timestamp": "1717680565000",
      "newsUrl": "https://www.thestreet.com/restaurants/popular-bankrupt-retailer-is-reopening-after-abruptly-closing-stores",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVpTalJ3ZGtaT01UbHJSSFJHVFJDcUJCaXFCQ2dLTWdZQklJaEpzZ1U=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVpTalJ3ZGtaT01UbHJSSFJHVFJDcUJCaXFCQ2dLTWdZQklJaEpzZ1U"
      },
      "hasSubnews": false
    },
    {
      "title": "Loblaw: Why Canadians are angry with their biggest supermarket",
      "snippet": "Food prices, including a 40 chicken, has stoked fury and calls for big foreign supermarket chains to come to Canada.",
      "publisher": "BBC.com",
      "timestamp": "1717639301000",
      "newsUrl": "https://www.bbc.com/news/articles/cd11ywyg6p0o",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNTFNRVpSYTFsR2NtTjZUVmxwVFJDb0FSaXNBaWdCTWdrQlFZcEFyaVhJTlFF=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNTFNRVpSYTFsR2NtTjZUVmxwVFJDb0FSaXNBaWdCTWdrQlFZcEFyaVhJTlFF"
      },
      "hasSubnews": false
    },
    {
      "title": "The US installed more solar in Q1 2024 than it did in all of 2018",
      "snippet": "In Q1 2024, the US saw the largest quarter of solar manufacturing growth in its history, bringing its total installed capacity to 200 GW.",
      "publisher": "Electrek.co",
      "timestamp": "1717646400000",
      "newsUrl": "https://electrek.co/2024/06/05/us-solar-q1-2024/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNUthRXRQZDJaWmR6UTRSemhKVFJDSEF4aVBCaWdLTWdNdFVCQQ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNUthRXRQZDJaWmR6UTRSemhKVFJDSEF4aVBCaWdLTWdNdFVCQQ"
      },
      "hasSubnews": false
    },
    {
      "title": "‘It is alarming:’ After second outage this year, experts say AT&T risks customer loyalty",
      "snippet": "Thousands of AT&T customers were left in the dark on Tuesday after a temporary outage prevented many customers from completing calls to other service ...",
      "publisher": "CNN",
      "timestamp": "1717583400000",
      "newsUrl": "https://www.cnn.com/2024/06/05/business/att-outage/index.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNXJlamxrV1RkRFkycE9VSHBGVFJDZkF4amlCU2dLTWdrWkpJU3NVZU5xcGdJ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNXJlamxrV1RkRFkycE9VSHBGVFJDZkF4amlCU2dLTWdrWkpJU3NVZU5xcGdJ"
      },
      "hasSubnews": false
    },
    {
      "title": "Bitcoin Price Rises After Bank of Canada Cuts Interest Rate Below 5%",
      "snippet": "Canada's central bank just cut its benchmark interest rate for the first time in four years—a pivotal move that suggests other monetary authorities could ...",
      "publisher": "Decrypt",
      "timestamp": "1717616134000",
      "newsUrl": "https://decrypt.co/234022/bitcoin-price-71600-after-canada-cut-interest-rate-below-5-percent",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXRTelpqU21jM1RUSllTRk5PVFJDSEF4aVBCaWdLTWdhUlY0aG9xZ1E=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXRTelpqU21jM1RUSllTRk5PVFJDSEF4aVBCaWdLTWdhUlY0aG9xZ1E"
      },
      "hasSubnews": false
    },
    {
      "title": "Bitcoin to reach 150,000 if Trump wins presidency: Standard Chartered",
      "snippet": "The U.S. presidential election has emerged as the next key catalyst for the price of bitcoin, and could push it to 150,000 by the end of the year, ...",
      "publisher": "CNBC",
      "timestamp": "1717682239000",
      "newsUrl": "https://www.cnbc.com/2024/06/06/bitcoin-to-reach-150000-if-trump-wins-presidency-standard-chartered.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNUZZV2hsV25GMGRGVlhSekIzVFJDZkF4amlCU2dLTWdrRkVvanJQU1RKa0FF=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNUZZV2hsV25GMGRGVlhSekIzVFJDZkF4amlCU2dLTWdrRkVvanJQU1RKa0FF"
      },
      "hasSubnews": false
    },
    {
      "title": "Sam Altman Was Bending the World to His Will Long Before OpenAI",
      "snippet": "From founding a startup at 19 to running Y Combinator at 29, the CEO behind ChatGPT is the most Silicon Valley man alive. An exclusive story and podcast.",
      "publisher": "Bloomberg",
      "timestamp": "1717664418000",
      "newsUrl": "https://www.bloomberg.com/news/features/2024-06-06/sam-altman-bent-the-world-to-his-will-long-before-chatgpt-s-rise",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUVPVzVYY0RjMVNuQkVSRU5DVFJDQUJSamdBeWdLTWdZbFZacnNJUWs=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUVPVzVYY0RjMVNuQkVSRU5DVFJDQUJSamdBeWdLTWdZbFZacnNJUWs"
      },
      "hasSubnews": false
    },
    {
      "title": "Nasdaq 100 Reaches Record Highs, Service Sector Strength Alleviates Economic Slowdown Concerns, Magnifice",
      "snippet": "Wall Street rallied Wednesday as the services activity gauge indicated a stronger-than-expected expansion in May, pushing back fears of an economic slowdown ...",
      "publisher": "Benzinga",
      "timestamp": "1717609434000",
      "newsUrl": "https://www.benzinga.com/markets/cryptocurrency/24/06/39190952/nasdaq-100-reaches-record-highs-service-sector-strength-alleviates-economic-slowdown-conce",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUZUM3BzY0VkMVdIWjNWV2N5VFJERUF4aW1CU2dLTWdZcEVJQjFSQUk=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUZUM3BzY0VkMVdIWjNWV2N5VFJERUF4aW1CU2dLTWdZcEVJQjFSQUk"
      },
      "hasSubnews": false
    },
    {
      "title": "lululemon athletica inc. Announces First Quarter Fiscal 2024 Results",
      "snippet": "Board of Directors Authorizes 1.0 Billion Increase in Its Stock Repurchase Program. Revenue increased 10% to 2.2 billion. Comparable sales increased 6%, ...",
      "publisher": "lululemon",
      "timestamp": "1717618105000",
      "newsUrl": "https://corporate.lululemon.com/media/press-releases/2024/06-05-2024-210527670",
      "hasSubnews": false
    },
    {
      "title": "Father's Day Gift Guide: 45 Gifts He'll Love in 2024",
      "snippet": "Consider this the only Father's Day gift guide you'll need in 2024. From picks for the home chef to music obsessives and more.",
      "publisher": "Camille Styles",
      "timestamp": "1717584750000",
      "newsUrl": "https://camillestyles.com/wellness/fathers-day-gift-guide-2024/",
      "hasSubnews": false
    },
    {
      "title": "Minnesota e-bike rebate applications postponed after website failure",
      "snippet": "MINNEAPOLIS (FOX 9) - The Minnesota Department of Revenue is postponing the launch of its e-bike rebate program application window after the website has ...",
      "publisher": "FOX 9 Minneapolis-St. Paul",
      "timestamp": "1717612800000",
      "newsUrl": "https://www.fox9.com/news/minnesota-e-bike-rebate-applications-postponed-after-website-failure",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iJ0NnNXJZMWcyWWtkQlgwbEpaM0ZJVFJDZ0FSaWNBaWdLTWdNdEFCZw=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iJ0NnNXJZMWcyWWtkQlgwbEpaM0ZJVFJDZ0FSaWNBaWdLTWdNdEFCZw"
      },
      "hasSubnews": false
    },
    {
      "title": "Yellen to warn of 'significant risks' of AI in finance while acknowledging 'tremendous opportunities'",
      "snippet": "Treasury Secretary Janet Yellen will deliver a speech Thursday warning of the \"significant risks\" posed by AI in finance, while acknowledging the ...",
      "publisher": "Fox Business",
      "timestamp": "1717620540000",
      "newsUrl": "https://www.foxbusiness.com/technology/yellen-warn-significant-risks-ai-finance-while-acknowledging-tremendous-opportunities",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNURlVlJtV0RaTWN6SlNOblZwVFJDZkF4ampCU2dLTWdZdFVJaXVJUWc=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNURlVlJtV0RaTWN6SlNOblZwVFJDZkF4ampCU2dLTWdZdFVJaXVJUWc"
      },
      "hasSubnews": false
    },
    {
      "title": "FTC prepares to sue largest U.S. alcohol distributor, alleging 'secret kickbacks'",
      "snippet": "Southern Glazer's made 26 billion in revenue last year. The FTC is likely to allege it has been providing \"secret kickbacks\" to large retail customers.",
      "publisher": "CNBC",
      "timestamp": "1717603484000",
      "newsUrl": "https://www.cnbc.com/2024/06/05/ftc-lawsuit-southern-glazers-alcohol.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iI0NnNUhaa050YlU1eGNsYzNORjltVFJDZkF4ampCU2dLTWdB=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iI0NnNUhaa050YlU1eGNsYzNORjltVFJDZkF4ampCU2dLTWdB"
      },
      "hasSubnews": false
    },
    {
      "title": "Dollar Tree Explores Sale of Family Dollar",
      "snippet": "Family Dollar has struggled with its operations in recent years, and its owner, Dollar Tree, said in March that it would close nearly 1000 of the stores.",
      "publisher": "The New York Times",
      "timestamp": "1717590167000",
      "newsUrl": "https://www.nytimes.com/2024/06/05/business/family-dollar-dollar-tree-sale.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVhSa2xtT1VocWNXRjJWbFYxVFJDUUF4allCQ2dLTWdhMUFvSVREUXM=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVhSa2xtT1VocWNXRjJWbFYxVFJDUUF4allCQ2dLTWdhMUFvSVREUXM"
      },
      "hasSubnews": false
    },
    {
      "title": "Hollywood giant Paramount Global braces for new era as bidders circle",
      "snippet": "For more than a century, Paramount Pictures has stood tall at the heart of Hollywood as it churned out hundreds of movies, from Sunset Boulevard to Titanic.",
      "publisher": "The Guardian",
      "timestamp": "1717578000000",
      "newsUrl": "https://www.theguardian.com/media/article/2024/jun/05/paramount-pictures-future-shari-redstone-",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNVpiVmx1U1daSFIxRjJXRE5PVFJDUkF4ajhCU2dLTWdreEVJRFBIZWt0ZVFB=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNVpiVmx1U1daSFIxRjJXRE5PVFJDUkF4ajhCU2dLTWdreEVJRFBIZWt0ZVFB"
      },
      "hasSubnews": false
    },
    {
      "title": "Nvidia options plays ahead of its stock split",
      "snippet": "Nvidia (NVDA) shares have slipped from the record highs it reached on Wednesday, when the company's market cap briefly surpassing 3 trillion.",
      "publisher": "Yahoo Finance",
      "timestamp": "1717686206000",
      "newsUrl": "https://finance.yahoo.com/video/nvidia-options-plays-ahead-stock-150326166.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVFUVTlwUzE5Q1RERklhVGN5VFJDZkF4amlCU2dLTWdhQmhvZ0x4Z00=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVFUVTlwUzE5Q1RERklhVGN5VFJDZkF4amlCU2dLTWdhQmhvZ0x4Z00"
      },
      "hasSubnews": false
    },
    {
      "title": "SAP is acquiring digital adoption platform WalkMe for a jaw-dropping 1.5B",
      "snippet": "While WalkMe has been working with SAP for quite some time, the acquisition will see the German giant using the technology as an add-on to its Business ...",
      "publisher": "VentureBeat",
      "timestamp": "1717610566000",
      "newsUrl": "https://venturebeat.com/ai/sap-is-acquiring-digital-adoption-platform-walkme-for-a-jaw-dropping-1-5b/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXBSVWhtUWxocWFrOUlSVmN4VFJEZ0FSaVFBeWdLTWdZRlU1UXlJUWs=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXBSVWhtUWxocWFrOUlSVmN4VFJEZ0FSaVFBeWdLTWdZRlU1UXlJUWs"
      },
      "hasSubnews": false
    },
    {
      "title": "'Everything Is Not Going to Be OK' in Private Equity, Apollo's Co-President Says",
      "snippet": "The private equity industry must face up to the reality of lower valuations, according to Apollo Global Management Inc.'s Scott Kleinman.",
      "publisher": "Bloomberg",
      "timestamp": "1717620126000",
      "newsUrl": "https://www.bloomberg.com/news/articles/2024-06-05/-everything-is-not-going-to-be-ok-in-pe-apollo-s-kleinman-says",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNDNVbHBxZG5KRFNHMUpWMjV4VFJDb0FSaXNBaWdCTWdZbFJZRHRJUWs=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNDNVbHBxZG5KRFNHMUpWMjV4VFJDb0FSaXNBaWdCTWdZbFJZRHRJUWs"
      },
      "hasSubnews": false
    },
    {
      "title": "Today is last day Walmart shoppers can claim up to 500. Here's how.",
      "snippet": "The clock is ticking for Walmart shoppers to get money back from the retailer. Today, June 5, is the last day for eligible customers to submit a claim for ...",
      "publisher": "CBS News",
      "timestamp": "1717609169000",
      "newsUrl": "https://www.cbsnews.com/news/walmart-weighted-grocery-settlement/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNHpSM1pPWkRSc05XaDJTV1pzVFJDUkF4ajhCU2dLTWdZaGxaYXJNUWM=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNHpSM1pPWkRSc05XaDJTV1pzVFJDUkF4ajhCU2dLTWdZaGxaYXJNUWM"
      },
      "hasSubnews": false
    },
    {
      "title": "Archer reveals details of plan to operate eVTOLs for United Airlines",
      "snippet": "Receipt of its Part 135 operator certificate from the FAA is a key step toward Archer deploying its electric air taxis for airport transfers.",
      "publisher": "The Air Current",
      "timestamp": "1717611784000",
      "newsUrl": "https://theaircurrent.com/industry-strategy/archer-reveals-details-of-plan-to-operate-evtols-for-united-airlines/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNWZOelpZUzNNMWEzaHBPV2d6VFJDZkF4ampCU2dLTWdrQllJd1BNYWVaS3dJ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNWZOelpZUzNNMWEzaHBPV2d6VFJDZkF4ampCU2dLTWdrQllJd1BNYWVaS3dJ"
      },
      "hasSubnews": false
    },
    {
      "title": "Wawa breaks ground on first Kentucky stores",
      "snippet": "Popular Pennsylvania-based convenience store chain Wawa broke ground on its first stores in Kentucky today in Nicholasville and Louisville.",
      "publisher": "KSR",
      "timestamp": "1717605063000",
      "newsUrl": "https://www.on3.com/teams/kentucky-wildcats/news/wawa-breaks-ground-on-first-kentucky-stores/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNU9aMUkwY0VGNGF6bFBVek5KVFJDUkF4ajhCU2dLTWdtWkJJWnBEdXRyOEFB=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNU9aMUkwY0VGNGF6bFBVek5KVFJDUkF4ajhCU2dLTWdtWkJJWnBEdXRyOEFB"
      },
      "hasSubnews": false
    },
    {
      "title": "Want to Pay Cash? That'll Cost You Extra",
      "snippet": "From ballpark hot dogs to parking tickets, more cash payments are coming with a fee.",
      "publisher": "The Wall Street Journal",
      "timestamp": "1717675200000",
      "newsUrl": "https://www.wsj.com/personal-finance/paying-cash-fees-reverse-atm-744d1bd6",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUtPSFJHVEdob1ZtOU5NMkptVFJDcUJCaXFCQ2dLTWdZVklZb3BPUVE=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUtPSFJHVEdob1ZtOU5NMkptVFJDcUJCaXFCQ2dLTWdZVklZb3BPUVE"
      },
      "hasSubnews": false
    },
    {
      "title": "Big Mac battle: McDonald's loses European Union trademark fight with Irish rival Supermac's",
      "snippet": "A top European Union court ruled that McDonald's has lost its Big Mac trademark in the 27-nation bloc, ruling in favor of Irish fast food rival Supermac's ...",
      "publisher": "ABC News",
      "timestamp": "1717597575000",
      "newsUrl": "https://abcnews.go.com/International/wireStory/big-mac-battle-mcdonalds-loses-burger-trademark-eu-110855101",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iMkNnNXRibTlWTjBaU1pVbGpOelpDVFJDZkF4ampCU2dLTWd1QkVZZ1R3ZVJieG5vb1ZB=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iMkNnNXRibTlWTjBaU1pVbGpOelpDVFJDZkF4ampCU2dLTWd1QkVZZ1R3ZVJieG5vb1ZB"
      },
      "hasSubnews": false
    },
    {
      "title": "How Electric Car Batteries Might Aid the Grid (and Win Over Drivers)",
      "snippet": "Automakers are exploring energy storage as a way to help utilities and save customers money, turning an expensive component into an industry asset.",
      "publisher": "The New York Times",
      "timestamp": "1717617925000",
      "newsUrl": "https://www.nytimes.com/2024/06/05/business/energy-environment/electric-car-batteries-grid.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNVNNa3gwVW10UmFtWmpNbE41VFJEQ0F4allCQ2dLTWdZVllvNnRwUWM=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNVNNa3gwVW10UmFtWmpNbE41VFJEQ0F4allCQ2dLTWdZVllvNnRwUWM"
      },
      "hasSubnews": false
    },
    {
      "title": "Lilly announces departure of Anat Ashkenazi, chief financial officer",
      "snippet": "PRNewswire/ -- Eli Lilly and Company (NYSE: LLY) announced today that Anat Ashkenazi has resigned as chief financial officer to pursue a career opportunity.",
      "publisher": "PR Newswire",
      "timestamp": "1717587900000",
      "newsUrl": "https://www.prnewswire.com/news-releases/lilly-announces-departure-of-anat-ashkenazi-chief-financial-officer-302163882.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUxTazVvUkdaR1NFTnJWM3B1VFJDYUF4anNCU2dLTWdZSlFwQktyZ2c=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUxTazVvUkdaR1NFTnJWM3B1VFJDYUF4anNCU2dLTWdZSlFwQktyZ2c"
      },
      "hasSubnews": false
    },
    {
      "title": "Zoox to test self-driving cars in Austin and Miami",
      "snippet": "Zoox, Amazon's self-driving unit, is bringing its autonomous vehicles to more cities. The self-driving technology company announced Wednesday plans.",
      "publisher": "TechCrunch",
      "timestamp": "1717610369000",
      "newsUrl": "https://techcrunch.com/2024/06/05/zoox-to-test-self-driving-cars-in-austin-and-miami/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNTJVRzlJYjA1NGMwc3ljRTVZVFJDZkF4ampCU2dLTWdZVjA0YXFTUU0=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNTJVRzlJYjA1NGMwc3ljRTVZVFJDZkF4ampCU2dLTWdZVjA0YXFTUU0"
      },
      "hasSubnews": false
    },
    {
      "title": "Tomball resident claims 3 million prize after buying winning Mega Millions ticket at NW Houston store",
      "snippet": "A Tomball resident has claimed a 3 million prize after purchasing a winning Mega Millions lottery ticket at a northwest Houston store.",
      "publisher": "KPRC Click2Houston",
      "timestamp": "1717616379000",
      "newsUrl": "https://www.click2houston.com/news/local/2024/06/05/tomball-resident-claims-3-million-prize-after-buying-winning-mega-millions-ticket-at-nw-houston-store/",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNDFkbkZVWVVrNU1WZDVZV2QzVFJDdEFSaWtBaWdCTWdZVjg0Q3RVUU0=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNDFkbkZVWVVrNU1WZDVZV2QzVFJDdEFSaWtBaWdCTWdZVjg0Q3RVUU0"
      },
      "hasSubnews": false
    },
    {
      "title": "Online marketplace eBay to drop American Express, citing fees, and says customers have other options",
      "snippet": "Online marketplace behemoth eBay said it plans to no longer accept American Express, citing what the company says are “unacceptably high fees” and that ...",
      "publisher": "The Associated Press",
      "timestamp": "1717602240000",
      "newsUrl": "https://apnews.com/article/ebay-american-express-payment-processing-merchant-fees-f04d01938e099b3d8043e91963426072",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNXFPWGhXVVhZeVMzQlRTMFJPVFJEVkFSakFBaWdLTWdhZFZJaXNyUVU=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNXFPWGhXVVhZeVMzQlRTMFJPVFJEVkFSakFBaWdLTWdhZFZJaXNyUVU"
      },
      "hasSubnews": false
    },
    {
      "title": "Toyota Admits To Cheating On Tests, Pauses Production Of 3 Models",
      "snippet": "Toyota's been in a bad spot with regulators recently. Its subsidiary Daihatsu rounded out 2023 by admitting to forging 30 years of crash test results, ...",
      "publisher": "Jalopnik",
      "timestamp": "1717607700000",
      "newsUrl": "https://jalopnik.com/toyota-admits-to-cheating-on-tests-pauses-production-o-1851521079",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNWlkVlZrZEZreE4wbDRTR05QVFJEckFoaUZCU2dLTWdZVmtKVHFOUWM=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNWlkVlZrZEZreE4wbDRTR05QVFJEckFoaUZCU2dLTWdZVmtKVHFOUWM"
      },
      "hasSubnews": false
    },
    {
      "title": "Gary Gensler Is Now Being Asked About Bonk ETFs Following Ethereum Approvals",
      "snippet": "SEC Chair Gary Gensler took a less hostile approach to crypto in a new interview following Ethereum ETF approvals—and was asked what's next.",
      "publisher": "Decrypt",
      "timestamp": "1717614858000",
      "newsUrl": "https://decrypt.co/234012/gary-gensler-asked-about-bonk-etfs-ethereum",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iK0NnNUxTMjR5VW1ORWVVOXFOR3hKVFJDTUF4aUdCaWdLTWdhaEZvRHNrUW8=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iK0NnNUxTMjR5VW1ORWVVOXFOR3hKVFJDTUF4aUdCaWdLTWdhaEZvRHNrUW8"
      },
      "hasSubnews": false
    },
    {
      "title": "Passenger tracks missing luggage to home of airport store worker, who is now charged with felony theft",
      "snippet": "A Florida man is facing a felony grand theft charge in Broward County after a plucky airline passenger scheduled to fly out of Fort Lauderdale-Hollywood ...",
      "publisher": "CNN",
      "timestamp": "1717611900000",
      "newsUrl": "https://www.cnn.com/travel/airline-passenger-tracks-missing-bag-felony-theft/index.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNUJNMk51Y1VKYU9ETk1USFpGVFJDb0FSaXJBaWdCTWdtRllaakZKbWxFREFJ=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNUJNMk51Y1VKYU9ETk1USFpGVFJDb0FSaXJBaWdCTWdtRllaakZKbWxFREFJ"
      },
      "hasSubnews": false
    },
    {
      "title": "Jim Cramer explains how Nvidia's gains can lift other stocks",
      "snippet": "CNBC's Jim Cramer on Wednesday told investors why Nvidia is sometimes able to boost other stocks when it soars.",
      "publisher": "CNBC",
      "timestamp": "1717628750000",
      "newsUrl": "https://www.cnbc.com/2024/06/05/how-nvidia-gains-lift-other-stocks-jim-cramer.html",
      "images": {
        "thumbnail": "https://news.google.com/api/attachments/CC8iL0NnNURiVmx6V2xsa1IyOXZUVU40VFJDZkF4ampCU2dLTWdtQkFhU09FU3M5QlFN=-w280-h168-p-df-rw",
        "thumbnailProxied": "https://i.zedtranslate.com/newsimage/CC8iL0NnNURiVmx6V2xsa1IyOXZUVU40VFJDZkF4ampCU2dLTWdtQkFhU09FU3M5QlFN"
      },
      "hasSubnews": false
    },
    {
      "title": "NAACP May Reinstate Travel Warning Against American Airlines",
      "snippet": "Seven years ago the NAACP issued a 'travel advisory' against American Airlines, lifted in July 2018. The civil rights organization says a “troubling pattern ...",
      "publisher": "View from the Wing",
      "timestamp": "1717621442000",
      "newsUrl": "https://viewfromthewing.com/naacp-may-reinstate-travel-warning-against-american-airlines/",
      "hasSubnews": false
    }
  ]
};