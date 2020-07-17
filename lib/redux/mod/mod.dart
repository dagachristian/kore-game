abstract class UpstreamMod {
  final List<DownstreamMod> _downstreams = [];

  void addDownstream(DownstreamMod downstream) {
    this._downstreams.add(downstream);
  }

  void removeDownstream(DownstreamMod downstream) {
    this._downstreams.remove(downstream);
  }
}

abstract class DownstreamMod {
  final List<UpstreamMod> _upstreams;

  DownstreamMod(this._upstreams) {
    _upstreams.forEach((upstream) => upstream.addDownstream(this));
  }

  void modified();
}

class ModBranch extends DownstreamMod with UpstreamMod {
  ModBranch(List<UpstreamMod> upstreams): super(upstreams);

  @override
  void modified() {
    this.._downstreams.forEach((downstream) => downstream.modified());
  }
}