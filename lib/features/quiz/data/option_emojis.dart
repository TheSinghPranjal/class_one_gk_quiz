/// Picture shown on the right of an answer option, looked up by the option's
/// text when a question doesn't supply its own `optionEmojis`. Only answers
/// that are a clear, drawable thing are listed; everything else shows no
/// picture.
const Map<String, String> _optionEmojis = {
  // Animals
  'ant': '🐜', 'bear': '🐻', 'bee': '🐝', 'beetle': '🪲', 'bird': '🐦',
  'blue whale': '🐋', 'bunny': '🐰', 'butterfly': '🦋', 'calf': '🐮',
  'camel': '🐪', 'cat': '🐱', 'cheetah': '🐆', 'colt': '🐴', 'cow': '🐄',
  'crab': '🦀', 'crow': '🐦‍⬛', 'cub': '🦁', 'deer': '🦌', 'dog': '🐕',
  'dolphin': '🐬', 'donkey': '🫏', 'dragonfly': '🪰', 'duck': '🦆',
  'eagle': '🦅', 'bald eagle': '🦅', 'elephant': '🐘', 'firefly': '✨',
  'fish': '🐠', 'flamingo': '🦩', 'fly': '🪰', 'foal': '🐴', 'frog': '🐸',
  'giraffe': '🦒', 'goat': '🐐', 'gorilla': '🦍', 'hen': '🐔',
  'honeybee': '🐝', 'horse': '🐎', 'hummingbird': '🐦', 'kid': '🐐',
  'kitten': '🐱', 'ladybird': '🐞', 'lamb': '🐑', 'lion': '🦁',
  'mosquito': '🦟', 'moth': '🦋', 'ostrich': '🐦', 'owl': '🦉',
  'panda': '🐼', 'parrot': '🦜', 'peacock': '🦚', 'penguin': '🐧',
  'pig': '🐖', 'rabbit': '🐇', 'shark': '🦈', 'sheep': '🐑',
  'silkworm': '🐛', 'snail': '🐌', 'sparrow': '🐦', 'tiger': '🐅',
  'tortoise': '🐢', 'turtle': '🐢', 'woodpecker': '🐦', 'worm': '🪱',
  'zebra': '🦓',
  // Homes
  'beehive': '🍯', 'burrow': '🕳️', 'house': '🏠', 'hut': '🛖',
  'igloo': '🧊', 'kennel': '🐕', 'nest': '🪺', 'shed': '🛖', 'tent': '⛺',
  'web': '🕸️', 'honeycomb': '🍯', 'den': '🪨', 'bungalow': '🏡',
  'palace': '🏰',
  // Food
  'apple': '🍎', 'banana': '🍌', 'berries': '🫐', 'brinjal': '🍆',
  'cabbage': '🥬', 'candy': '🍬', 'carrot': '🥕', 'cauliflower': '🥦',
  'cherries': '🍒', 'chips': '🍟', 'coffee': '☕', 'corn': '🌽',
  'cucumber': '🥒', 'ginger': '🫚', 'grapes': '🍇', 'honey': '🍯',
  'ice cream': '🍦', 'juice': '🧃', 'kiwi': '🥝', 'mango': '🥭',
  'milk': '🥛', 'mushroom': '🍄', 'nut': '🥜', 'nuts': '🥜',
  'onion': '🧅', 'orange': '🍊', 'papaya': '🥭', 'peach': '🍑',
  'pear': '🍐', 'pepper': '🫑', 'plum': '🍑', 'plums': '🍑',
  'potato': '🥔', 'rice': '🍚', 'salt': '🧂', 'soda': '🥤',
  'spinach': '🥬', 'sugar': '🍬', 'sweets': '🍬', 'tea': '🍵',
  'tomato': '🍅', 'vegetables': '🥦', 'water': '💧',
  'watermelon': '🍉', 'wheat': '🌾', 'fruit': '🍎', 'fruits': '🍎',
  'grain': '🌾', 'grains': '🌾',
  // Plants & nature
  'cloud': '☁️', 'coconut tree': '🌴', 'desert': '🏜️', 'flower': '🌸',
  'forest': '🌳', 'island': '🏝️', 'leaf': '🍃', 'leaves': '🍃',
  'lightning': '⚡', 'lily': '🌷', 'lotus': '🪷', 'mango tree': '🌳',
  'moon': '🌙', 'the moon': '🌙', 'ocean': '🌊', 'rainbow': '🌈',
  'rose': '🌹', 'seed': '🌱', 'snow': '❄️', 'star': '⭐', 'stars': '✨',
  'sun': '☀️', 'the sun': '☀️', 'sunflower': '🌻', 'tulip': '🌷',
  'earth': '🌍', 'jupiter': '🪐', 'saturn': '🪐', 'mars': '🔴',
  'rocket': '🚀', 'astronaut': '🧑‍🚀', 'comet': '☄️', 'a comet': '☄️',
  'winter': '⛄', 'summer': '☀️', 'monsoon': '🌧️', 'spring': '🌼',
  'autumn': '🍂',
  // Transport
  'aeroplane': '✈️', 'ambulance': '🚑', 'auto-rickshaw': '🛺',
  'bicycle': '🚲', 'boat': '⛵', 'bus': '🚌', 'car': '🚗', 'canoe': '🛶',
  'fire engine': '🚒', 'helicopter': '🚁', 'metro': '🚇',
  'motorcycle': '🏍️', 'scooter': '🛵', 'ship': '🚢', 'skateboard': '🛹',
  'speedboat': '🚤', 'tractor': '🚜', 'train': '🚆', 'tram': '🚊',
  'truck': '🚚', 'yacht': '🛥️', 'submarine': '🤿', 'ferry': '⛴️',
  'bullock cart': '🐂',
  // People & helpers
  'baby': '👶', 'barber': '💈', 'carpenter': '🪚', 'chef': '🧑‍🍳',
  'dentist': '🦷', 'doctor': '🧑‍⚕️', 'farmer': '🧑‍🌾',
  'firefighter': '🧑‍🚒', 'mechanic': '🧑‍🔧', 'nurse': '🧑‍⚕️',
  'pilot': '🧑‍✈️', 'plumber': '🔧', 'police officer': '👮',
  'postman': '📮', 'teacher': '🧑‍🏫', 'tailor': '🧵',
  'grandfather': '👴', 'grandmother': '👵', 'family': '👨‍👩‍👧',
  // Body
  'brain': '🧠', 'ears': '👂', 'eyes': '👀', 'foot': '🦶', 'hand': '✋',
  'heart': '❤️', 'lungs': '🫁', 'nose': '👃', 'teeth': '🦷',
  'tongue': '👅', 'bones': '🦴', 'legs': '🦵', 'hair': '💇',
  // Things & places
  'books': '📚', 'bulb': '💡', 'crayons': '🖍️', 'hospital': '🏥',
  'kite': '🪁', 'kites': '🪁', 'school': '🏫', 'shoes': '👟',
  'slippers': '🩴', 'sunglasses': '🕶️', 'sweater': '🧥',
  'umbrella': '☂️', 'rain coat': '🧥', 'cap': '🧢', 'trumpet': '🎺',
  'bank': '🏦', 'post office': '🏤', 'garden': '🏡', 'park': '🏞️',
  'taj mahal': '🕌', 'the taj mahal': '🕌', 'candles only': '🕯️',
  'medals': '🏅', 'world cup trophy': '🏆',
  // Sports & games
  'badminton': '🏸', 'basketball': '🏀', 'bowling': '🎳', 'boxing': '🥊',
  'chess': '♟️', 'cricket': '🏏', 'cycling': '🚴', 'football': '⚽',
  'golf': '⛳', 'hockey': '🏑', 'field hockey': '🏑', 'ice hockey': '🏒',
  'ludo': '🎲', 'running': '🏃', 'sailing': '⛵', 'skating': '⛸️',
  'skiing': '⛷️', 'snowboarding': '🏂', 'swimming': '🏊',
  'table tennis': '🏓', 'tennis': '🎾', 'rowing': '🚣',
  // Colours & shapes
  'red': '🔴', 'blue': '🔵', 'green': '🟢', 'yellow': '🟡',
  'purple': '🟣', 'brown': '🟤', 'black': '⚫', 'white': '⚪',
  'circle': '⚪', 'square': '🟧', 'triangle': '🔺', 'diamond': '🔷',
  'cube': '🧊',
  // Festivals
  'christmas': '🎄', 'diwali': '🪔', 'holi': '🎨', 'eid': '🌙',
  'new year': '🎆', 'happy birthday': '🎂',
};

/// The picture for [label], or null when the answer isn't a drawable thing.
String? emojiForOption(String label) =>
    _optionEmojis[label.trim().toLowerCase()];
