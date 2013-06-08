class HostsController < ApplicationController
  
  def index
    @hosts = Host.order('hosts.interval, hosts.url')
  end
  
  def new
    @host = Host.new
  end
  
  def create
    @host = Host.new(host_params)
    if @host.save
      redirect_to hosts_path
    else
      render partial: 'new'
    end
  end
  
  def ping
    @hosts = Host.order('hosts.interval, hosts.url')
    @hosts.each do |h|
      h.pings.build.perform
    end
    redirect_to hosts_path
  end
  
private
  def host_params
    params.require(:host).permit(:url, :interval, :enabled)
  end

end
