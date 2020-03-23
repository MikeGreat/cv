class Repository {
  int id;
  String name;
  String htmlUrl;
  String description;
  String url;
  String language;
  bool hasWiki;
  bool archived;
  bool disabled;
  String defaultBranch;

  Repository(
      {this.id,
        this.name,
        this.htmlUrl,
        this.description,
        this.url,
        this.language,
        this.hasWiki,
        this.archived,
        this.disabled,
        this.defaultBranch});

  Repository.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    htmlUrl = json['html_url'];
    description = json['description'];
    url = json['url'];
    language = json['language'];
    hasWiki = json['has_wiki'];
    archived = json['archived'];
    disabled = json['disabled'];
    defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['url'] = this.url;
    data['language'] = this.language;
    data['has_wiki'] = this.hasWiki;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['default_branch'] = this.defaultBranch;
    return data;
  }
}